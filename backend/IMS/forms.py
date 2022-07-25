from dataclasses import fields
from django.forms import ModelForm
from .models import Invoice_details, Invoices, Products, Purchases, Suppliers

class addProductForm(ModelForm):
    class Meta:
        model = Products
        fields = ['supplier_id', 'product_name', 'unit_price', 'quantity']

class addPurchaseForm(ModelForm):
    class Meta:
        model = Purchases
        fields = ['product_id', 'quantity', 'purchase_price']

class addSupplierForm(ModelForm):
    class Meta:
        model = Suppliers
        fields = ['supplier_name', 'supplier_number', 'email']

class addInvoiceForm(ModelForm):
    class Meta:
        model = Invoice_details
        fields = ['ordered_quantity', 'line_total', 'product_id']