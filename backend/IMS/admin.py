from django.contrib import admin
from .models import Suppliers, Products, Purchases, Invoice_details, Customers, Invoices

# Register your models here.
admin.site.register(Suppliers)
admin.site.register(Products)
admin.site.register(Purchases)
admin.site.register(Invoice_details)
admin.site.register(Customers)
admin.site.register(Invoices)