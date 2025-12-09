from django.db import models

# Create your models here.

class Login(models.Model):
    username=models.CharField(max_length=20)
    password=models.CharField(max_length=15)
    type=models.CharField(max_length=20)

class User(models.Model):
    name=models.CharField(max_length=20)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=20)
    dob=models.DateField()
    place=models.CharField(max_length=50)
    post=models.CharField(max_length=20)
    pin=models.CharField(max_length=20)
    district=models.CharField(max_length=20)
    eventdate=models.DateField()
    gender=models.CharField(max_length=20)
    photo=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)

class Vendor(models.Model):
    vendorname=models.CharField(max_length=20)
    contactnumber=models.BigIntegerField()
    photo=models.CharField(max_length=100)
    experience=models.BigIntegerField()
    email=models.CharField(max_length=20)
    place=models.CharField(max_length=50)
    post=models.CharField(max_length=20)
    pin=models.CharField(max_length=20)
    district=models.CharField(max_length=20)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    status=models.CharField(max_length=20)
    category=models.CharField(max_length=100)

class Vendorreview(models.Model):
    date=models.DateField()
    review=models.CharField(max_length=100)
    rating=models.FloatField()
    USER=models.ForeignKey(User,on_delete=models.CASCADE)
    VENDOR=models.ForeignKey(Vendor,on_delete=models.CASCADE)

class Weddingblog(models.Model):
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    filename=models.CharField(max_length=100)
    description=models.CharField(max_length=100)
    video=models.CharField(max_length=200)
    date=models.DateField()

class Complaint(models.Model):
    date=models.DateField()
    USER=models.ForeignKey(User,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=100)
    reply=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class Appreview(models.Model):
    date=models.DateField()
    review=models.CharField(max_length=100)
    rating=models.FloatField()
    USER=models.ForeignKey(User,on_delete=models.CASCADE)

class Services(models.Model):
    VENDOR=models.ForeignKey(Vendor,on_delete=models.CASCADE)
    servicename=models.CharField(max_length=100)
    photo=models.CharField(max_length=100)
    servicefees=models.BigIntegerField()

class Gallery(models.Model):
    date=models.DateField()
    description=models.CharField(max_length=300)
    filename=models.CharField(max_length=300)
    video=models.CharField(max_length=300)
    VENDOR=models.ForeignKey(Vendor,on_delete=models.CASCADE)

class Bookingrequest(models.Model):
    eventdate=models.DateField()
    SERVICES=models.ForeignKey(Services,on_delete=models.CASCADE)
    USER=models.ForeignKey(User,on_delete=models.CASCADE)
    status=models.CharField(max_length=100)

class Paymentreports(models.Model):
    date = models.DateField()
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    REQUEST = models.ForeignKey(Bookingrequest, on_delete=models.CASCADE)
    amount=models.BigIntegerField()
    paymentstatus=models.CharField(max_length=100)

class Reviewsofwork(models.Model):
    date = models.DateField()
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    review = models.CharField(max_length=100)
    rating = models.FloatField()
    uploadphoto=models.CharField(max_length=100)
    VENDOR=models.ForeignKey(Vendor,on_delete=models.CASCADE)

class Eventplan(models.Model):
    eventdate=models.DateField()
    reminder=models.CharField(max_length=100)
    USER = models.ForeignKey(User, on_delete=models.CASCADE)

class Expensedetails(models.Model):
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField()
    amount=models.BigIntegerField()
    narration=models.CharField(max_length=100)

