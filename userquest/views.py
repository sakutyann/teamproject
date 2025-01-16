from django.shortcuts import render, get_object_or_404, redirect
from .models import Coupon,UserCoupon
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import PhotoSubmission
from formapp.models import QuestRegister
from .utils import get_exif_data, get_geotagging, get_coordinates
from django.core.files.storage import default_storage
from PIL import Image
from django.db.models import Q  # 複数条件を扱うために必要
from django.contrib.auth.decorators import login_required
from django.views import View 
from formapp.models import Quest  # Questモデルをインポート
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required



def questnowformworldfunction(request):
          return render(request, 'questnow.html')

def questnotformworldfunction(request):
          return render(request, 'questnot.html')

def questdoformworldfunction(request):
          return render(request, 'questdo.html')

def questgoformworldfunction(request):
          return render(request, 'questgo.html')

# お題写真アップロード画面
# def questgoformworldfunction(request):
#           return render(request, 'questgo.html')

@method_decorator(login_required, name='dispatch')
class QuestGoView(View):
    template_names_yes = "questyes.html"
    template_names_out = "questout.html"
    
    def get_context_data(self, **kwargs):
       # クエストの主キーを取得
        quest = Quest.objects.get(pk=kwargs['pk'])
        # 現在のクエストに紐づくお題を取得
        quest_registers = quest.quest_registers.all()
        print(quest_registers)
        # 共通のコンテキストを返す
        return {
            'quest': quest,  # クエスト情報
            'quest_registers': quest_registers,  # お題情報
        }
        
    # getメソッド
    def get(self, request, *args, **kwargs):
        # contextデータを取得
        context = self.get_context_data(**kwargs)
        return render(request, "questgo.html", context)
    
    # postメソッド
    def post(self, request, *args, **kwargs):
          # contextデータを取得
          context = self.get_context_data(**kwargs)
          photo = request.FILES['photo']
          if not photo:
            return render(request, self.template_names_out, {'result': '写真がアップロードされていません。'})
          
          temp_path = default_storage.save(photo.name, photo)
          print('if文クリア')
          try:
              print('try内部侵入')
              # EXIF情報から緯度・経度を取得
              image = Image.open("media\\"+temp_path)
              exif_data = get_exif_data(image)
              geotags = get_geotagging(exif_data)
              coordinates = get_coordinates(geotags)

              print('iamge:',image,',exif_data:',exif_data,',geotags:',geotags,',coordinates:',coordinates)
              if coordinates and len(coordinates) == 2:  # 緯度と経度の両方が存在する場合のみ
                latitude, longitude = coordinates
                PhotoSubmission.objects.create(
                    photo=photo,
                    latitude=latitude,
                    longitude=longitude,
                )

                # 緯度・経度の範囲を計算
                latitude_min = latitude - 1/10
                latitude_max = latitude + 1/10
                longitude_min = longitude - 1/10
                longitude_max = longitude + 1/10

                # 位置情報管理アプリのデータと照合（範囲内で検索）
                if QuestRegister.objects.filter(
                    Q(latitude__gte=latitude_min, latitude__lte=latitude_max) &
                    Q(longitude__gte=longitude_min, longitude__lte=longitude_max)
                    ).exists():
                    # 成功した場合
                    print('判定：成功')
                    print(request, latitude, longitude, context)
                    return render(request, self.template_names_yes,context)
                else:
                    # 照合失敗
                    print('判定：失敗')
                    return render(request, self.template_names_out, {'latitude': latitude, 'longitude': longitude, 'context': context})
              else:
                # 位置情報が存在しない場合
                print('判定：位置情報なし')
                return render(request, self.template_names_out, {'result': '位置情報が含まれていません。', 'context':context})
          except Exception as e:
            # 例外発生時も失敗判定
            print('判定：例外発生')
            return render(request,self.template_names_out, {'result': f'エラーが発生しました: {e}', 'context':context})


class QuestYesView(View):
    """クエスト挑戦ページのビュー"""
    template_name = "questyes.html"
    def get(self, request, *args, **kwargs):
        # クエストの主キーを取得
        quest = Quest.objects.get(pk=kwargs['pk'])
        # 現在のクエストに紐づくお題を取得
        quest_registers = quest.quest_registers.all()
        print(quest)

        # クエスト詳細ページを表示
        context = {
            'quest': quest, #クエスト情報
            'quest_registers': quest_registers,  # お題情報
        }
        return render(request, self.template_name, context) 
   
   
class QuestOutView(View):
  template_name = "questout.html"
  def get(self, request, *args, **kwargs):
    quest = Quest.objects.get(pk=kwargs['pk'])
    quest_registers = quest.quest_resigters.all()
    print(quest)
    context = {
        'quest': quest, #クエスト情報
        'quest_registers': quest_registers,  # お題情報
        }
    return render(request, self.template_name, context) 

class QuestFinView(View):
  template_name = "questfin.html"
  def get(self, request, *args, **kwargs):
    quest = Quest.objects.get(pk=kwargs['pk'])
    quest_registers = quest.quest_resigters.all()
    print(quest)
    context = {
        'quest': quest, #クエスト情報
        'quest_registers': quest_registers,  # お題情報
        }
    return render(request, self.template_name, context) 



@login_required
def coupon_list(request):
    user_coupons = UserCoupon.objects.filter(
        user_account_id=request.user,
        coupon_status=False  # 未使用クーポン
    )
    print(user_coupons)
    PREFECTURES = {0:'北海道', 1:'青森県',2: '岩手県',3: '宮城県',4:'秋田県',5: '山形県',6: '福島県',7: '茨城県',8: '栃木県',9: '群馬県',10: '埼玉県',
                   11:'千葉県',12:'東京都',13:'神奈川県',14: '新潟県',15:'富山県',16:'石川県',17: '福井県',18: '山梨県',19: '長野県',20:'岐阜県',21: '静岡県',
                   22: '愛知県',23: '三重県',24: '滋賀県',25:'京都府',26: '大阪府',27: '兵庫県',28:'奈良県',29: '和歌山県',30: '鳥取県',31: '島根県',32: '岡山県',
                   33:'広島県',34: '山口県',35: '徳島県',36 :'香川県',37 :'愛媛県',38: '高知県',39:'福岡県',40: '佐賀県',41: '長崎県',42: '熊本県',43: '大分県',
                   44: '宮崎県',45: '鹿児島県',46: '沖縄県',}

    categorized_coupons = {}
    for user_coupon in user_coupons:
        # `prefecture`を取得
        prefecture_id = int(user_coupon.coupon_id.quest_id.prefecture)  # 数値に変換
        prefecture_name = PREFECTURES.get(prefecture_id, "不明な地域")  # 地域名を取得

        # クーポン情報を構築
        coupon_info = {
            'id': user_coupon.coupon_id.coupon_id,
            'name': user_coupon.coupon_id.coupon_description,
            'coupon_time': user_coupon.coupon_id.used_at,
        }

        # 地域ごとにクーポンを分類
        if prefecture_name not in categorized_coupons:
            categorized_coupons[prefecture_name] = []
        categorized_coupons[prefecture_name].append(coupon_info)

    # デバッグ用プリント（必要に応じて削除）
    print(categorized_coupons)

    return render(request, 'coupon.html', {'categorized_coupons': categorized_coupons})

def coupon_use(request, coupon_id):
    user_coupon = get_object_or_404(UserCoupon, coupon_id=coupon_id)
    coupon = user_coupon.coupon_id
    return render(request, 'couponuse.html', {'coupon': coupon})

def used_coupons(request):
    coupons = UserCoupon.objects.filter(user_account_id=request.user, coupon_status=True)
    return render(request, 'couponpast.html', {'coupon': coupons})

def coupon_complete(request, coupon_id):
    # UserCoupon のインスタンスを取得
    user_coupon = get_object_or_404(UserCoupon, coupon_id=coupon_id)

    # coupon_status を True に更新
    user_coupon.coupon_status = True
    user_coupon.save()

    # couponend.html に遷移
    return render(request, 'couponend.html', {'coupon': user_coupon})

# クエスト挑戦画面
def quest_challenge_view(request):
  return render(request, 'quest_challenge.html')




# Create your views herequestyesformworldfunction.
