from django.db import router
from django.urls import path
from . import views
app_name = 'route'

urlpatterns = [
    path('logout/', views.logout, name="logout"),
    path('dashboard/', views.dashboard, name="dashboard"),
    path('products/', views.products, name="products"),
    path('purchase/', views.purchase, name="purchase"),
    path('suppliers/', views.supplier, name="supplier"),
    path('invoice/', views.invoice, name="invoice"),
    path('', views.login, name="login"),
]
