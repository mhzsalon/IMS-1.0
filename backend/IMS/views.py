
from urllib import request
from django.shortcuts import render, redirect
from django.contrib.auth. models import User, auth
from django.contrib import messages
from django.views import View

from .models import Products
from .forms import addProductForm

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
