from django import forms
from .models import Quest, QuestRegister
from django.core.exceptions import ValidationError


# クエスト登録フォーム
class QuestRegisterForm(forms.ModelForm):
    class Meta:
        model = QuestRegister
        fields = ['name', 'address', 'answer_photo', 'hours', 'reward', 'additional_notes']
        widgets = {
            'name': forms.TextInput(attrs={
                'placeholder': '名前を入力',
                'class': 'form-control',
            }),
            'address': forms.TextInput(attrs={
                'placeholder': '住所を入力',
                'class': 'form-control',
            }),
            'answer_photo': forms.ClearableFileInput(attrs={
                'class': 'form-control',
            }),
            'hours': forms.TextInput(attrs={
                'placeholder': '例: 9:00 - 17:00',
                'class': 'form-control',
            }),
            'reward': forms.NumberInput(attrs={
                'placeholder': '報酬額を入力',
                'class': 'form-control',
            }),
            'additional_notes': forms.Textarea(attrs={
                'placeholder': '特記事項など',
                'class': 'form-control',
                'rows': 3,
            }),
        }

    # 画像サイズ制限のバリデーション
    def clean_answer_photo(self):
        photo = self.cleaned_data.get('answer_photo')
        if photo:
            max_size = 5 * 1024 * 1024  # 5MB
            if photo.size > max_size:
                raise ValidationError("画像サイズは5MB以内にしてください。")
        return photo


class QuestModelForm(forms.ModelForm):
    class Meta:
        model = Quest
        fields = ['title', 'description', 'deadline', 'requester', 'prefecture', 'payment']
    
    PREFECTURE_CHOICES = [
      # ('key', 'name')
        (0, '北海道'),
        (1, '青森県'),
        (2, '岩手県'),
        (3, '宮城県'),
        (4, '秋田県'),
        (5, '山形県'),
        (6, '福島県'),
        (7, '茨城県'),
        (8, '栃木県'),
        (9, '群馬県'),
        (10, '埼玉県'),
        (11, '千葉県'),
        (12, '東京都'),
        (13, '神奈川県'),
        (14, '新潟県'),
        (15, '富山県'),
        (16, '石川県'),
        (17, '福井県'),
        (18, '山梨県'),
        (19, '長野県'),
        (20, '岐阜県'),
        (21, '静岡県'),
        (22, '愛知県'),
        (23, '三重県'),
        (24, '滋賀県'),
        (25, '京都府'),
        (26, '大阪府'),
        (27, '兵庫県'),
        (28, '奈良県'),
        (29, '和歌山県'),
        (30, '鳥取県'),
        (31, '島根県'),
        (32, '岡山県'),
        (33, '広島県'),
        (34, '山口県'),
        (35, '徳島県'),
        (36, '香川県'),
        (37, '愛媛県'),
        (38, '高知県'),
        (39, '福岡県'),
        (40, '佐賀県'),
        (41, '長崎県'),
        (42, '熊本県'),
        (43, '大分県'),
        (44, '宮崎県'),
        (45, '鹿児島県'),
        (46, '沖縄県'),
    ]
    
    title = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    description = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control'}))
    deadline = forms.DateField(widget=forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}))
    requester = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    prefecture = forms.ChoiceField(
        choices=PREFECTURE_CHOICES,
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'prefecture'})
    )
    payment = forms.ChoiceField(
        choices=[
            ('銀行振込', '銀行振込'),
            ('クレジットカード', 'クレジットカード'),
            ('コンビニ支払い', 'コンビニ支払い'),
        ],
        widget=forms.Select(attrs={'class': 'form-control', 'id': 'payment'})
    )