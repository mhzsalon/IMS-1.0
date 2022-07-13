from django.forms import ModelForm
from .models import Products

class addProductForm(ModelForm):
    class Meta:
        model = Products
        fields = ['supplier_id', 'product_name', 'unit_price', 'quantity']
    