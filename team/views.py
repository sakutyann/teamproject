from django.views import View 
from formapp.models import Quest, QuestRegister  # Questモデルをインポート
from formapp.forms import QuestModelForm  # QuestModelFormをインポート
from userquest.models import UserQuestNow, QuestSubMission
from django.shortcuts import redirect, get_object_or_404, render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator

class MainView(View):
    """クエスト一覧ページのビュー"""
    template_name = "main.html"

    def get(self, request, *args, **kwargs):
        # クエストデータを取得
        quests = Quest.objects.all()

        # 0～46のキーに基づいて都道府県別にクエストを分ける
        prefectures = {}
        for quest in quests:
            # 都道府県のキーを取得
            prefecture_key = quest.prefecture

            # まだその都道府県のキーが辞書に無ければ、リストを初期化
            if prefecture_key not in prefectures:
                prefectures[prefecture_key] = []

            # 都道府県キーに対応するリストにクエストを追加
            prefectures[prefecture_key].append(quest)

        # ユーザーがログインしているかを確認
        context = {
            'is_authenticated': request.user.is_authenticated,
            'username': request.user.username if request.user.is_authenticated else None,
            'prefectures': prefectures,  # 都道府県別に分けたクエストデータ
        }

        return render(request, self.template_name, context)
    
    


@method_decorator(csrf_exempt, name='dispatch')
class QuestDetailView(View):
    """クエスト詳細ページのビュー"""
    template_name = "questdo.html"

    def get(self, request, *args, **kwargs):
        # クエストの主キーを取得
        quest = Quest.objects.get(pk=kwargs['pk'])

        # 現在のクエストに紐づくお題を取得
        quest_registers = quest.quest_registers.all()
        print(quest)
        # すべてのお題が完了しているか確認
        all_completed = QuestSubMission.objects.filter(
            quest=quest, completed=False
        ).exists()
               
         # 報酬IDを文字列に変換
        reward_mapping = {
            1: "3%OFF",
            2: "5%OFF",
            3: "10%OFF",
        }
        try:
            # `quest.reward`を整数に変換してマッピングを取得
            reward_key = int(quest.reward)  # 型変換が必要な場合
            quest.reward_display = reward_mapping.get(reward_key, "不明")
        except (ValueError, TypeError):
            # 型変換エラーや`None`の場合の対策
            quest.reward_display = "不明"
        
        # デバッグ用: データ確認
        print('do')
        print(f"Quest ID: {quest.id}")
        print(f"Quest Registers: {quest_registers}")
        print(f"Quest Reward (display): {quest.reward}")
        
        # クエスト詳細ページを表示
        context = {
            'quest': quest, #クエスト情報
            'quest_registers': quest_registers,  # お題情報
            'all_completed': not all_completed,  # 全て完了していれば True
        }
        
        return render(request, self.template_name, context) 
    
    def post(self, request, *args, **kwargs):
      """挑戦ボタン押下時の処理"""
      # クエストの主キーを取得
      quest = get_object_or_404(Quest, pk=kwargs['pk'])
      # 現在のクエストに紐づくお題を取得
      quest_registers = quest.quest_registers.all()
      print(quest)

      # 未登録のお題を `QuestSubMission` に登録
      for register in quest_registers:
          QuestSubMission.objects.get_or_create(
              quest=quest,
              quest_register=register
          )


      # ユーザーが既にこのクエストを登録済みか確認
      user_quest, created = UserQuestNow.objects.get_or_create(
          user=request.user,
          quest=quest
      )
      print('created:',created)
      # クエスト詳細ページを表示
      context = {
          'quest': quest, #クエスト情報
          'quest_registers': quest_registers,  # お題情報
      }

      if created:
          # 新規登録の場合の処理
          return render(request, self.template_name, context)
      else:
          # 既に挑戦済みの場合の処理
          return render(request, self.template_name, context)


    
    

# 初期画面
def title_view(request):
    return render(request, 'title.html')
     
    
# クーポン一覧
def couponformworldfunction(request):
          return render(request, 'coupon.html')


# クエスト挑戦画面
@method_decorator(csrf_exempt, name='dispatch')
class QuestChallengeView(View):
    """クエスト挑戦ページのビュー"""
    template_name = "quest_challenge.html"
    def get(self, request, *args, **kwargs):
        # クエストの主キーを取得
        quest = get_object_or_404(Quest, pk=kwargs['pk'])
        quest = Quest.objects.get(pk=kwargs['pk'])
        # 現在のクエストに紐づくお題を取得
        quest_registers = quest.quest_registers.all()
        print(quest)

         # 報酬IDを文字列に変換
        reward_mapping = {
            1: "3%OFF",
            2: "5%OFF",
            3: "10%OFF",
        }

        try:
            # `quest.reward`を整数に変換してマッピングを取得
            reward_key = int(quest.reward)  # 型変換が必要な場合
            quest.reward_display = reward_mapping.get(reward_key, "不明")
        except (ValueError, TypeError):
            # 型変換エラーや`None`の場合の対策
            quest.reward_display = "不明"
        
        # デバッグ用: データ確認
        print('do')
        print(f"Quest ID: {quest.id}")
        print(f"Quest Registers: {quest_registers}")
        print(f"Quest Reward (display): {quest.reward}")
        
        # クエスト詳細ページを表示
        context = {
            'quest': quest, #クエスト情報
            'quest_registers': quest_registers,  # お題情報
        }
        return render(request, self.template_name, context) 

    def post(self, request, *args, **kwargs):
        """挑戦ボタン押下時の処理"""
        # クエストの主キーを取得
        quest = get_object_or_404(Quest, pk=kwargs['pk'])

        # ユーザーが既にこのクエストを登録済みか確認
        user_quest, created = UserQuestNow.objects.get_or_create(
            user=request.user,
            quest=quest
        )
        print('created:',created)
        if created:
            # 新規登録の場合の処理
            return redirect('quest_detail', pk=kwargs['pk'])
        else:
            # 既に挑戦済みの場合の処理
            return redirect('quest_detail', pk=kwargs['pk'])
