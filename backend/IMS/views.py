
from datetime import datetime
from itertools import product
from multiprocessing import context
from urllib import request
from xmlrpc.client import DateTime
from django.shortcuts import render, redirect
from django.contrib.auth. models import auth
from django.contrib import messages

from .models import Customers, Invoice_details, Invoices, Products, Purchases, Suppliers
from .forms import addInvoiceForm, addProductForm, addPurchaseForm, addSupplierForm
import os

# Create your views here.


def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        users = auth.authenticate(username=username, password=password)
        # dbUser = request.user.username
        # dbPassword = request.user.password1

        # userName= auth.authenticqate(username=username)
        # password= auth.authenticqate(password=password)

        if users is not None:
            auth.login(request, users)
            # messages.error(request, "Welcome to IMS Dashboard :)")
            return redirect('dashboard/')
        # elif username != dbUser:
        #     messages.error(request, "The user doesn't exit!")
        #     return redirect('/')
        # elif password != dbPassword:
        #     messages.error(request, "The password is incorrect")
        #     return redirect('/')
        else:
            print("user does not exists")
            messages.error(request, "Invalid user or password!")
            return redirect('/')
    else:
        return render(request, 'login.html')


def dashboard(request):
    return render(request, 'index.html', {'title': 'Dashboard - IMS'})


def products(request):
    form = addProductForm()

    if request.method == "POST":
        form = addProductForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('../products/')

    productData = Products.objects.all()
    context = {'form': form, 'title': 'Products - IMS', 'data': productData}
    return render(request, 'products.html', context)


def logout(request):
    auth.logout(request)
    return redirect('/')


def purchase(request):
    form = addPurchaseForm()

    if request.method == 'POST':
        form = addPurchaseForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('../purchase/')

    purchaseData = Purchases.objects.all()
    context = {'form': form, 'title': 'Purchase - IMS',
               'purchase_data': purchaseData}
    return render(request, 'purchase.html', context)


def supplier(request):
    form = addSupplierForm()

    if request.method == 'POST':
        form = addSupplierForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('../suppliers/')

    supplierData = Suppliers.objects.all()
    context = {'form': form, 'title': 'Supplier - IMS',
               'supplier_data': supplierData}
    return render(request, 'supplier.html', context)


def generateInvoice(request):
    form = addInvoiceForm()
    new_id = Invoices.objects.latest('id').id
    if request.method == 'POST':
        newinvoice = Invoices.objects.create()
        new_id = newinvoice.id

    context = {'form': form, 'new_id': new_id}
    return render(request, 'generate_invoice.html', context)


# def invoice(request):
#     form = addInvoiceForm(request.POST)
#     new_invoice_detail = Invoice_details.object.create(invoice_id=20)



def invoice(request):
    form = addInvoiceForm()
    new_invoice = Invoices.objects.latest('id')
    print(new_invoice)
    new_id = new_invoice.id + 1
    if request.method == 'POST':
        form = addInvoiceForm(request.POST)

        # newinvoice = Invoices.objects.create()
        # new_id = newinvoice.id
        # context = {'new_id': new_id}
        # prod = request.POST['product_id']
        # qty = request.POST['ordered_quantity']
        # line = request.POST['line_total']
        # print("////-----------------------")
        # print(prod)
        # Invoice_details.objects.create(invoice_id=new_invoice, product_id_id=prod, ordered_quantity=qty, line_total=line)
        # return redirect('../invoice/')

        if form.is_valid():
            # new_invoice_detail = Invoice_details.object.create(invoice_id=new_id)
            # id = Invoices.objects.get(id=new_invoice)
            instance = form.save(commit=False)
            instance.invoice_id = new_invoice
            instance.save()

            return redirect('route:generateInvoice')
        invoiceData = Invoice_details.objects.filter(invoice_id=new_invoice)

    else:
        invoiceData = Invoice_details.objects.filter(invoice_id=new_id)
        context = {'form': form, 'title': 'Invoice - IMS',
                    'invoice_data': invoiceData
                    }
        return render(request, 'invoice.html', context)


def cancel(request):
    new_invoice = Invoices.objects.latest('id')
    try:
        new_invoice.delete()
        return redirect('route:invoice')
    except:
        print("cannot delete____________________________________________")
    return redirect('route:generateInvoice')


def createReceipts():
    store_name= "ABC Super Market"
    location = "Kathmandu, Nepal"
    store_tel = "01-3425342"
    bill_no = Invoices.objects.latest('id')
    date = Invoices.objects.latest('invoice_date')

    print("--------------------------------")
    print(bill_no.id)
    print(date.invoice_date)
    receipt = open(f"Receipt.txt", "w+")
    receipt.write(f"\t\t{store_name.title()}\n")
    receipt.write(f"\t\t{location}\n")
    receipt.write(f"\t\t{store_tel}\n\n\n")

    receipt.write(f"Bill no: {bill_no.id}\n")
    receipt.write(f"Date: {date.invoice_date}\n")

    receipt.write("-" * 47)
    receipt.write(f"\nParticular \t\t Qty \t Rate \t Amount\n")
    receipt.write("-" * 47)

    invoice = Invoice_details.objects.filter(invoice_id=bill_no)
    for product in invoice:
        receipt.write(f"\n{product.product_id} \t\t {product.ordered_quantity} \t {product.line_total} \t {product.ordered_quantity * product.line_total}")

    receipt.write(f"\n" + "-" * 47)
    receipt.close()


def save(request):
    createReceipts()
    file_path = "Receipt.txt"
    os.startfile(file_path, 'print')
    return redirect("route:invoice")