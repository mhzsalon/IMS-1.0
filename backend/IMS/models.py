
from django.db import models

# Create your models here.


class Suppliers(models.Model):
    supplier_name = models.CharField(max_length=100)
    supplier_number = models.IntegerField(default=0)
    email = models.EmailField(max_length=100, default='')
    def __str__(self):
        return self.supplier_name


class Products(models.Model):
    supplier_id = models.ForeignKey('Suppliers', on_delete=models.CASCADE)
    product_name = models.CharField(max_length=100)
    unit_price = models.FloatField(default=1.0) 
    quantity = models.IntegerField(default=1)
    def __str__(self):
        return self.product_name


class Purchases(models.Model):
    product_id = models.ForeignKey('Products', on_delete=models.CASCADE)
    purchase_date = models.DateField(auto_now=True)
    quantity = models.IntegerField(default=1)
    purchase_price = models.FloatField(default=1.0)


class Invoice_details(models.Model):
    invoice_id = models.ForeignKey('Invoices', on_delete=models.CASCADE)
    product_id = models.ForeignKey('Products', on_delete=models.CASCADE)
    ordered_quantity = models.IntegerField(default=1)
    line_total = models.FloatField(default=1.0)


class Customers(models.Model):
    customer_name = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    customer_number = models.IntegerField(default=0)
    email = models.EmailField(max_length=100, default='')


class Invoices(models.Model):
    invoice_date = models.DateField(auto_now=True)
    customer_id = models.ForeignKey('Customers', on_delete=models.CASCADE)
    total = models.FloatField(default=1.0)
