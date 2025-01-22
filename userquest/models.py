from django.db import models
from django.contrib.auth.models import User  # ユーザー情報をリンクする場合に使用
from formapp.models import Quest
from django.conf import settings

# userquest/models.py

class Coupon(models.Model):
    coupon_id = models.AutoField(primary_key=True, verbose_name="クーポンID")
    quest_id = models.ForeignKey(Quest,on_delete=models.PROTECT, verbose_name="クエストID")
    coupon_description = models.TextField(null=True, verbose_name="クーポン詳細")
    used_at = models.DateTimeField(verbose_name="使用期限")
    
    def __str__(self):
        return f"Coupon {self.coupon_id}"

class UserCoupon(models.Model):
    user_coupon_id = models.AutoField(primary_key=True, verbose_name="ユーザークーポンID")
    user_account_id = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,verbose_name="ユーザーID")
    coupon_id = models.ForeignKey(Coupon, on_delete=models.CASCADE, verbose_name="クーポンID"
    ) 
    issued_at = models.DateTimeField(auto_now_add=True, verbose_name="発行日時")
    coupon_status = models.BooleanField(default=False, verbose_name="ステータス")  # False: 未使用, True: 使用済み

    def __str__(self):
        return f"Coupon {self.coupon_id} for User {self.user_account_id}"


class PhotoSubmission(models.Model):
    photo = models.ImageField(upload_to='photos/')
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
# Create your models here.


# お題テーブル
# class QuestSubMission(models.Model):
#     quest_register = models.ForeignKey(
#         'formapp.QuestRegister',  # アプリ名とモデル名を指定
#         on_delete=models.CASCADE,
#         verbose_name="クエスト詳細"
#     )
#     completed = models.BooleanField(default=False, verbose_name="完了判定")

#     def __str__(self):
#         return f"{self.quest_register.name} (Completed: {self.completed})"
      
      
class QuestSubMission(models.Model):
    quest = models.ForeignKey(
        'formapp.Quest',  # クエストとの関連付け
        on_delete=models.CASCADE,
        verbose_name="クエスト",
    )
    quest_register = models.ForeignKey(
        'formapp.QuestRegister',  # お題との関連付け
        on_delete=models.CASCADE,
        verbose_name="クエスト詳細"
    )
    completed = models.BooleanField(default=False, verbose_name="完了判定")

    def __str__(self):
        return f"{self.quest_register.name} (Completed: {self.completed})"

# クエストテーブル
class UserQuestNow(models.Model):
    # ユーザーアカウントID
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, 
        on_delete=models.PROTECT, 
        verbose_name="ユーザー"
    )
    # クエストID
    quest = models.ForeignKey(
        'formapp.Quest', 
        on_delete=models.PROTECT, 
        verbose_name="クエスト"
    )
    # 完了判定
    completed = models.BooleanField(default=False, verbose_name="クエスト完了判定")

    def __str__(self):
        return f"User: {self.user}, Quest: {self.quest} (Completed: {self.completed})"

    def check_completion(self):
        """
        全てのサブミッションが完了していれば、このクエストも完了にする。
        """
        all_completed = self.quest.submissions.all().filter(completed=False).exists() == False
        if all_completed:
            self.completed = True
            self.save()

