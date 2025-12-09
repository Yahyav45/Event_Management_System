import smtplib
from datetime import datetime

from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from myapp.models import Login, User, Vendor, Complaint, Vendorreview, Appreview, Weddingblog, Bookingrequest, Services, \
    Reviewsofwork, Gallery, Paymentreports, Eventplan, Expensedetails


def login(request):
    return render(request,"loginindex.html")

def login_post(request):
    username=request.POST["uname"]
    password=request.POST["pass"]
    lg=Login.objects.filter(username=username,password=password)
    if lg:
        lg1=Login.objects.get(username=username,password=password)
        request.session['lid']=lg1.id
        if lg1.type=="admin":
            return HttpResponse("<script>alert('admin login success');window.location='/myapp/adminhome/'</script>")
        elif lg1.type=="vendor":
            return HttpResponse("<script>alert('vendor login success');window.location='/myapp/vendorhome/'</script>")
        else:
            return HttpResponse("<script>alert('user not found');window.location='/myapp/login/'</script>")
    return HttpResponse("<script>alert('user not found');window.location='/myapp/login/'</script>")


def appreview(request):
    app_review=Appreview.objects.all()
    return render(request,"admin/APP REVIEW.html",{"app_review":app_review})

def appreview_post(request):
    fromdate= request.POST["textfield"]
    todate= request.POST["textfield2"]

    app_review = Appreview.objects.filter(date__range=[fromdate,todate])
    return render(request, "admin/APP REVIEW.html", {"app_review": app_review})


def changepassword(request):
    return render(request,"admin/CHANGE PASWORD.html")




def changepassword_post(request):
    oldpassword=request.POST["textfield"]
    newpassword=request.POST["textfield2"]
    confirmpassword=request.POST["textfield3"]
    check=Login.objects.filter(password=oldpassword,id=request.session['lid'] )
    if check.exists():
        if newpassword==confirmpassword:
            data=Login.objects.get(password=oldpassword,id=request.session['lid'])
            data.password=confirmpassword
            data.save()
            return HttpResponse("<script>alert('password changed successfully');window.location='/myapp/login/'</script>")
        else:
            return HttpResponse("<script>alert('please check your newpassword and confirmpassword');window.location='/myapp/changepassword/'</script>")

    else:
        return HttpResponse(
            "<script>alert('user not found');window.location='/myapp/changepassword/'</script>")



def sendreply(request,id):
    id=Complaint.objects.get(id=id).id
    return render(request,"admin/SEND REPLY.html",{"id":id})


def sendreply_post(request):
    reply=request.POST["textfield"]
    id=request.POST['id']
    r=Complaint.objects.filter(id=id).update(reply=reply,status='reply')
    return HttpResponse(
        "<script>alert('success');window.location='/myapp/viewcomplaints/'</script>")


def vendorreview(request):
    reviews=Vendorreview.objects.all()
    return render(request, "admin/VENDOR REVIEW.html",{"reviews":reviews})



def vendorreview_post(request):
    fromdate = request.POST["textfield"]
    todate = request.POST["textfield2"]

    reviews = Vendorreview.objects.filter(date__range=[fromdate,todate])
    return render(request, "admin/VENDOR REVIEW.html", {"reviews": reviews})


def viewapprovedvendor(request):
    data=Vendor.objects.filter(status="approve")
    return render(request,"admin/VIEW APPROVED VENDORS.html",{"data":data})

def viewapprovedvendor_post(request):
    search=request.POST["textfield"]
    data = Vendor.objects.filter(status="approve",vendorname__icontains=search)
    return render(request, "admin/VIEW APPROVED VENDORS.html", {"data": data})


def viewrejectedvendors(request):
    data = Vendor.objects.filter(status="reject")
    return render(request, "admin/VIEW REJECTED VENDORS.html",{"data":data})


def viewrejectedvendors_post(request):
    search = request.POST["textfield"]
    data = Vendor.objects.filter(status="reject",vendorname__icontains=search)
    return render(request, "admin/VIEW REJECTED VENDORS.html",{"data":data})


def viewcomplaints(request):
    complaint=Complaint.objects.all()
    return render(request,"admin/VIEW COMPLAINTS.html",{"complaint":complaint})

def viewcomplaints_post(request):
    fromdate = request.POST["textfield"]
    todate = request.POST["textfield2"]

    complaint = Complaint.objects.filter(date__range=[fromdate,todate])
    return render(request, "admin/VIEW COMPLAINTS.html", {"complaint": complaint})


def viewusers(request):
    data=User.objects.all()
    return render(request, "admin/VIEW USERS.html",{"data":data})

def viewusers_post(request):
    search = request.POST["textfield"]
    data = User.objects.filter(name__icontains=search)
    return render(request, "admin/VIEW USERS.html", {"data": data})


def viewvendor(request):
    details=Vendor.objects.filter(LOGIN__type='pending')
    return render(request, "admin/VIEW VENDOR.html",{"details":details})

def approve(request,id):
    Login.objects.filter(id=id).update(type='vendor')
    Vendor.objects.filter(LOGIN_id=id).update(status='approve')
    return HttpResponse("<script>alert('approved');window.location='/myapp/viewvendor/'</script>")

def reject(request,id):
    Login.objects.filter(id=id).update(type='reject')
    Vendor.objects.filter(LOGIN_id=id).update(status='reject')
    return HttpResponse("<script>alert('reject');window.location='/myapp/viewvendor/'</script>")

def viewvendor_post(request):
    search = request.POST["textfield"]
    details = Vendor.objects.filter(LOGIN__type='pending',vendorname__icontains=search)
    return render(request, "admin/VIEW VENDOR.html", {"details": details})


def addweddingblogs(request):
    return render(request,"admin/ADD WEDDING BLOGS.html")

def addweddingblogs_post(request):
    image=request.FILES["imageField"]
    description=request.POST["textfield"]
    fs = FileSystemStorage()
    date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
    fs.save(date, image)
    path = fs.url(date)



    obj=Weddingblog()
    obj.date=datetime.now().today()
    obj.filename=path
    obj.description=description
    obj.LOGIN=Login.objects.get(id=request.session['lid'])
    obj.save()


    return HttpResponse(
        "<script>alert('success');window.location='/myapp/viewweddingblogs/'</script>")

def deleteweddingblogs(request,id):
    Weddingblog.objects.get(id=id).delete()
    return HttpResponse(
        "<script>alert('success');window.location='/myapp/viewweddingblogs/'</script>")


def editweddingblogs(request,id):
    obj=Weddingblog.objects.get(id=id)
    return render(request,"admin/EDIT WEDDING BLOGS.html",{"data":obj})

def editweddingblogs_post(request):
    id=request.POST['id']
    description = request.POST["textfield"]

    obj=Weddingblog.objects.get(id=id)
    if 'imageField' in request.FILES:
        image = request.FILES["imageField"]
        fs = FileSystemStorage()
        date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
        fs.save(date, image)
        path = fs.url(date)
        obj.filename = path
        obj.save()

    obj.date = datetime.now().today()
    obj.description = description
    obj.LOGIN = Login.objects.get(id=request.session['lid'])
    obj.save()
    return HttpResponse(
        "<script>alert('success');window.location='/myapp/viewweddingblogs/'</script>")


def viewweddingblogs(request):
    wblogs=Weddingblog.objects.filter(LOGIN=request.session['lid'])
    return render(request, "admin/VIEW WEDDING BLOGS.html",{"wblogs":wblogs})

def viewweddingblogs_post(request):
    frm = request.POST["textfield"]
    to = request.POST["textfield2"]

    wblogs=Weddingblog.objects.filter(LOGIN=request.session['lid'],date__range=[frm,to])
    return render(request, "admin/VIEW WEDDING BLOGS.html",{"wblogs":wblogs})


def addgallery(request):
    return render(request,"vendor/ADD GALLERY.html")

def addgallery_post(request):
    image=request.FILES["imageField"]
    video=request.FILES["imageField2"]
    description=request.POST["textfield"]
    fs = FileSystemStorage()
    date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
    fs.save(date, image)
    path = fs.url(date)

    fs2 = FileSystemStorage()
    date2 = datetime.now().strftime('%Y%f%d-%H%M%S') + ".mp4"
    fs2.save(date2, video)
    path2 = fs2.url(date2)

    obj=Gallery()
    obj.date=datetime.now().today()
    obj.filename=path
    obj.video=path2
    obj.description=description
    obj.VENDOR=Vendor.objects.get(LOGIN=request.session['lid'])
    obj.save()


    return HttpResponse(
        "<script>alert('success');window.location='/myapp/vendorhome/'</script>")




def servicevendor(request):
    return render(request,"vendor/SERVICE VENDOR.html")


def servicevendor_post(request):
    service = request.POST["textfield"]
    #slot = request.POST["textfield2"]
    servicefee = request.POST["textfield3"]
    photo = request.FILES["textfield4"]
    fs = FileSystemStorage()
    date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
    fs.save(date, photo)
    path = fs.url(date)
    s=Services()
    s.VENDOR=Vendor.objects.get(LOGIN=request.session['lid'])
    s.servicename=service
    s.servicefees=servicefee
    s.photo=path
    s.save()
    return HttpResponse("<script>alert('approved');window.location='/myapp/servicevendor/'</script>")
def editvendorservices(request,id):
    res=Services.objects.get(id=id)
    return render(request,"vendor/EDIT VENDOR SERVICES.html",{"data":res})
def editvendorservices_post(request):
    service = request.POST["textfield"]
    servicefee = request.POST["textfield3"]

    id=request.POST['id']
    s = Services.objects.get(id=id)
    if 'photo' in request.FILES:
        photo = request.FILES["textfield4"]
        fs = FileSystemStorage()
        date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
        fs.save(date, photo)
        path = fs.url(date)
        s.photo = path
        s.save

    s.VENDOR = Vendor.objects.get(LOGIN=request.session['lid'])
    s.servicename = service
    s.servicefees = servicefee
    s.save()
    return HttpResponse("<script>alert('approved');window.location='/myapp/servicevendor/'</script>")



def deleteservices(request,id):
    Services.objects.filter(id=id).delete()
    return HttpResponse("<script>alert('deleted');window.location='/myapp/servicevendor/'</script>")









    # return render(request, "vendor/SERVICE VENDOR.html")
def termsandconditions(request):
    return render(request,"vendor/terms and condition.html")

def signupvendor(request):
    return render(request,"vendor/SIGN UP VENDOR.html")

def signupvendor_post(request):
    username=request.POST["textfield"]
    contactno=request.POST["textfield2"]
    location=request.POST["textfield3"]
    experience = request.POST["textfield4"]
    email = request.POST["textfield5"]
    place = request.POST["textfield6"]
    post = request.POST["textfield7"]
    pin = request.POST["textfield8"]
    district = request.POST["textfield9"]
    password = request.POST["textfield10"]
    cat = request.POST["cat"]
    confirmpassword = request.POST["textfield11"]
    photo = request.FILES["photo"]

    fs = FileSystemStorage()
    date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
    fs.save(date, photo)
    path = fs.url(date)

    if password == confirmpassword:
        obj = Login()
        obj.username = email
        obj.password = confirmpassword
        obj.type = 'pending'
        obj.save()

        obj2 = Vendor()
        obj2.vendorname = username
        obj2.contactnumber = contactno
        obj2.experience = experience
        obj2.email = email
        obj2.place = place
        obj2.post = post
        obj2.photo = path
        obj2.pin = pin
        obj2.district = district
        obj2.category = cat
        obj2.LOGIN = obj
        obj2.status = "pending"
        obj2.save()

        return HttpResponse("<script>alert('success');window.location='/myapp/login/'</script>")
    else:
        return HttpResponse("<script>alert('password mismateched');window.location='/myapp/signupvendor/'</script>")


def viewbookingrequest(request):
    booking=Bookingrequest.objects.filter(status='pending',SERVICES__VENDOR__LOGIN_id= request.session['lid'])
    return render(request,"vendor/VIEW BOOKING REQUEST.html",{"booking":booking})

def viewbookingrequest_post(request):
    search = request.POST["textfield"]
    booking=Bookingrequest.objects.filter(status='pending',SERVICES__VENDOR__LOGIN_id= request.session['lid'],USER__name__icontains=search)
    return render(request,"vendor/VIEW BOOKING REQUEST.html",{"booking":booking})

def approvebookingrequest(request,id):
    res=Bookingrequest.objects.filter(id=id).weddupdate(status='approved')
    return HttpResponse("<script>alert('approved');window.location='/myapp/viewbookingrequest/'</script>")


def rejectbookingrequest(request,id):
    res=Bookingrequest.objects.filter(id=id).update(status='rejected')
    return HttpResponse("<script>alert('rejected');window.location='/myapp/viewbookingrequest/'</script>")


def approvedbookingrequest(request):
    res=Bookingrequest.objects.filter(status='approved',SERVICES__VENDOR__LOGIN_id= request.session['lid'])
    return render(request,"vendor/APPROVED BOOKING REQUEST.html",{"data":res})


def approvedbookingrequest_post(request):
    search = request.POST["textfield"]
    res=Bookingrequest.objects.filter(status='approved',SERVICES__VENDOR__LOGIN_id= request.session['lid'],USER__name__icontains=search)
    return render(request,"vendor/APPROVED BOOKING REQUEST.html",{"data":res})



def rejectedbookingrequest(request):
    res=Bookingrequest.objects.filter(status='rejected',SERVICES__VENDOR__LOGIN_id= request.session['lid'])
    return render(request,"vendor/REJECTED BOOKING REQUEST.html",{"data":res})

def rejectedbookingrequest_post(request):
    search = request.POST["textfield"]
    res=Bookingrequest.objects.filter(status='rejected',SERVICES__VENDOR__LOGIN_id= request.session['lid'],USER__name__icontains=search)
    return render(request,"vendor/REJECTED BOOKING REQUEST.html",{"data":res})





def viewgallery(request):
    glr=Gallery.objects.filter(VENDOR__LOGIN_id=request.session['lid'])
    return render(request, "vendor/VIEW GALLERY.html",{'data':glr})


def viewgallery_post(request):
    search = request.POST["textfield"]

    glr = Gallery.objects.filter(VENDOR__LOGIN_id=request.session['lid'],description__icontains=search)
    return render(request, "vendor/VIEW GALLERY.html", {'data': glr})


def editgallery(request,id):
    res=Gallery.objects.get(id=id)
    return render(request, "vendor/EDIT GALLERY.html",{"data":res})

def editgallery_post(request):
    description=request.POST["textfield"]

    id=request.POST["id"]

    obj=Gallery.objects.get(id=id)

    if 'imageField' in request.FILES:
        image = request.FILES["imageField"]
        if image !='':

            fs = FileSystemStorage()
            date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
            fs.save(date, image)
            path = fs.url(date)
            obj.filename = path
            obj.save()

    if 'imageField2' in request.FILES:
        video = request.FILES["imageField2"]
        if video !='':
            fs2 = FileSystemStorage()
            date2 = datetime.now().strftime('%Y%f%d-%H%M%S') + ".mp4"
            fs2.save(date2, video)
            path2 = fs2.url(date2)
            obj.video = path2
            obj.save()

    obj.date=datetime.now().today()
    obj.description=description
    # obj.VENDOR=Vendor.objects.get(LOGIN=request.session['lid'])
    obj.save()


    return HttpResponse(
        "<script>alert('success');window.location='/myapp/viewgallery/'</script>")

def deletegallery(request,id):
    Gallery.objects.filter(id=id).delete()
    return HttpResponse("<script>alert('deleted');window.location='/myapp/viewgallery/'</script>")

def viewprofilevendor(request):
    r=Vendor.objects.get(LOGIN_id=request.session['lid'])
    return render(request, "vendor/VIEW PROFILE VENDOR.html",{'data':r})


def editvendorprofile(request):
    r=Vendor.objects.get(LOGIN_id=request.session['lid'])

    return render(request,"vendor/EDIT VENDOR PROFILE.html",{'data':r})

def editvendorprofile_post(request):
    username=request.POST["textfield"]
    contactno=request.POST["textfield2"]
    # location=request.POST["textfield3"]
    experience = request.POST["textfield4"]
    email = request.POST["textfield5"]
    place = request.POST["textfield6"]
    post = request.POST["textfield7"]
    pin = request.POST["textfield8"]
    district = request.POST["textfield9"]



    obj = Login.objects.get(id=request.session['lid'])
    obj.username = email
    obj.save()

    obj2 =Vendor.objects.get(LOGIN_id=request.session['lid'])
    if 'photo' in request.FILES:
        photo = request.FILES["photo"]
        if photo !="":
            fs = FileSystemStorage()
            date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
            fs.save(date, photo)
            path = fs.url(date)
            obj2.photo = path

    obj2.vendorname = username
    obj2.contactnumber = contactno
    obj2.experience = experience
    obj2.email = email
    obj2.place = place
    obj2.post = post
    obj2.pin = pin
    obj2.district = district
    obj2.LOGIN = obj
    obj2.save()

    return HttpResponse("<script>alert('updated');window.location='/myapp/viewprofilevendor/'</script>")





def viewprofilevendor_post(request):
    search = request.POST["textfield"]

    return render(request, "vendor/VIEW PROFILE VENDOR.html")

def viewreview(request):
    view_review = Vendorreview.objects.filter(VENDOR__LOGIN_id=request.session['lid'])
    # view_review = Reviewsofwork.objects.all()
    return render(request, "vendor/VIEW REVIEW.html",{"data":view_review})

def viewreview_post(request):
    frm = request.POST["textfield"]
    to = request.POST["textfield2"]
    view_review = Reviewsofwork.objects.filter(VENDOR__LOGIN_id=request.session['lid'], date__range=[frm, to])
    return render(request, "vendor/VIEW REVIEW.html",{"data":view_review})



def viewservices(request):
    service=Services.objects.filter(VENDOR__LOGIN_id=request.session['lid'])
    return render(request, "vendor/VIEW SERVICES.html",{"service":service})

def viewservices_post(request):
    search = request.POST["textfield"]
    service=Services.objects.filter(VENDOR__LOGIN_id=request.session['lid'],servicename__icontains=search)
    return render(request, "vendor/VIEW SERVICES.html",{"service":service})

def addwedding(request):
    return render(request, "vendor/ADD WEDDING.html")

def addwedding_post(request):
    name=request.POST["textfield"]
    image = request.FILES["imageField"]
    video = request.FILES["imageField2"]
    description = request.POST["textarea"]

    fs = FileSystemStorage()
    date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
    fs.save(date, image)
    path = fs.url(date)

    fs = FileSystemStorage()
    date = datetime.now().strftime('%Y%f%d-%H%M%S') + "1.mp4"
    fs.save(date, video)
    path1 = fs.url(date)

    obj = Weddingblog()
    obj.date = datetime.now().today()
    obj.filename = path
    obj.description = description
    obj.video = path1
    obj.LOGIN = Login.objects.get(id=request.session['lid'])
    obj.save()
    return HttpResponse("<script>alert('updated');window.location='/myapp/addwedding/'</script>")


def editwedding(request,id):
    data=Weddingblog.objects.get(id=id)
    return render(request, "vendor/EDIT WEDDING.html",{"data":data})

def editwedding_post(request):
    id=request.POST["cid"]


    description = request.POST["textarea"]

    obj = Weddingblog.objects.get(id=id)


    if 'imageField' in request.FILES:
        image = request.FILES["imageField"]
        fs = FileSystemStorage()
        date = datetime.now().strftime('%Y%f%d-%H%M%S') + ".jpg"
        fs.save(date, image)
        path = fs.url(date)
        obj.filename = path


    if 'imageField2' in request.FILES:
        video = request.FILES["imageField2"]
        fs = FileSystemStorage()
        date = datetime.now().strftime('%Y%f%d-%H%M%S') + "1.mp4"
        fs.save(date, video)
        path1 = fs.url(date)

        obj.video = path1

    obj.date = datetime.now().today()
    obj.description = description
    obj.LOGIN = Login.objects.get(id=request.session['lid'])
    obj.save()
    return HttpResponse("<script>alert('updated');window.location='/myapp/vendor_viewweddingblogs/'</script>")

def deletewedding(request,id):
    Weddingblog.objects.get(id=id).delete()
    return HttpResponse(
        "<script>alert('success');window.location='/myapp/vendor_viewweddingblogs/'</script>")


def vendor_viewweddingblogs(request):
    wblogs = Weddingblog.objects.filter(LOGIN_id=request.session['lid'])
    return render(request, "vendor/VENDOR_VIEW WEDDING BLOGS.html", {"wblogs": wblogs})


def vendor_viewweddingblogs_post(request):
    search = request.POST["textfield"]
    return render(request, "vendor/VENDOR_VIEW WEDDING BLOGS.html")

def adminhome(request):
    return render(request, "admin/admin index.html")
def vendorhome(request):
    return render(request, "vendor/vendor index.html")


def viewpaymentreport(request):
    obj=Paymentreports.objects.filter(REQUEST__SERVICES__VENDOR__LOGIN_id=request.session['lid'])
    return render(request, "vendor/VIEW PAYMENT REPORT.html",{'data':obj})

def viewpaymentreport_post(request):
    frm=request.POST["textfield"]
    to=request.POST["textfield2"]

    obj=Paymentreports.objects.filter(REQUEST__SERVICES__VENDOR__LOGIN_id=request.session['lid'],date__range=[frm,to])
    return render(request, "vendor/VIEW PAYMENT REPORT.html",{'data':obj})

#-----------------------------------------------------------------------------------------------------------------------------------


def user_loginpost(request):
    username=request.POST["uname"]
    password=request.POST["pass"]
    lg=Login.objects.filter(username=username,password=password)
    if lg:
        lg1=Login.objects.get(username=username,password=password)
        lid=lg1.id
        if lg1.type=="user":
            data=User.objects.get(LOGIN_id=lid)

            return JsonResponse({"status":"ok","lid":str(lid),"name":data.name,"photo":data.photo})

        else:
            return JsonResponse({"status":"no"})
    else:
            return JsonResponse({"status": "no"})



def user_changepassword_post(request):
    oldpassword=request.POST["oldpassword"]
    newpassword=request.POST["newpassword"]
    confirmpassword=request.POST["confirmpassword"]
    lid=request.POST["lid"]
    check=Login.objects.get(id=lid)
    if check.password==oldpassword:
        if newpassword==confirmpassword:

            Login.objects.filter(id=lid).update(password=newpassword)

            return JsonResponse({"status":"ok"})
        else:
            return JsonResponse({"status":"no"})

    else:
        return JsonResponse({"status": "no"})

def signup_user(request):
    username=request.POST["name"]
    contactno=request.POST["phone"]
    eventdate=request.POST["eventdate"]
    email = request.POST["email"]
    place = request.POST["place"]
    post = request.POST["post"]
    pin = request.POST["pin"]
    district = request.POST["district"]
    photo = request.POST["photo"]
    dob = request.POST["dob"]


    import base64
    date = datetime.now().strftime("%Y%m%d-%H%M%S")
    a = base64.b64decode(photo)
    fh = open("C:\\Users\\yahya vk\\PycharmProjects\\EVENTMNGMNT\\media\\USER" + date + ".jpg", "wb")
    path = "/media/" + date + ".jpg"
    fh.write(a)
    fh.close()
    password = request.POST["password"]
    confirmpassword = request.POST["confirmpassword"]



    obj = Login()
    obj.username = email
    obj.password = confirmpassword
    obj.type = 'user'
    obj.save()

    obj2 =User()
    obj2.name = username
    obj2.phone = contactno
    obj2.dob=dob

    obj2.email = email
    obj2.place = place
    obj2.post = post
    obj2.pin = pin
    obj2.district = district
    obj2.eventdate = eventdate
    obj2.photo = path
    obj2.LOGIN = obj
    obj2.save()

    return JsonResponse({"status": "ok"})

def edituserprofile_post(request):
    username=request.POST["textfield"]
    contactno=request.POST["textfield2"]
    # location=request.POST["textfield3"]
    experience = request.POST["textfield4"]
    email = request.POST["textfield5"]
    place = request.POST["textfield6"]
    post = request.POST["textfield7"]
    pin = request.POST["textfield8"]
    district = request.POST["textfield9"]
    photo = request.POST["photo"]
    lid=request.POST["lid"]



    obj = Login.objects.get(id=lid)
    obj.username = email
    obj.save()

    obj2 =Vendor.objects.get(LOGIN_id=lid)
    if len(photo)>5:
        import base64
        date=datetime.now().strftime("%Y%m%d-%H%M%S")
        a=base64.b64decode(photo)
        fh=open("C:\\Users\\yahya vk\\PycharmProjects\\EVENTMNGMNT\\media\\USER"+date+".jpg","wb")
        path="/media/"+date+".jpg"
        obj2.photo = path
        fh.write(a)
        fh.close()


    obj2.vendorname = username
    obj2.contactnumber = contactno
    obj2.experience = experience
    obj2.email = email
    obj2.place = place
    obj2.post = post
    obj2.pin = pin
    obj2.district = district
    obj2.LOGIN = obj
    obj2.save()

    return JsonResponse({"status": "ok"})


def setmarriagedate(request):
    eventdate=request.POST["date"]
    reminder=request.POST["reminder"]
    uid=request.POST["uid"]

    obj2 = Eventplan()
    obj2.eventdate = eventdate
    obj2.reminder = reminder
    obj2.USER = User.objects.get(LOGIN_id=uid)
    obj2.save()
    return JsonResponse({"status": "ok"})

def viewmarriagedate(request):
    uid = request.POST['uid']
    r = Eventplan.objects.filter(USER__LOGIN_id=uid)
    l = []
    for i in r:
        l.append({"uid": i.id,
                  "eventdate": i.eventdate,
                  "reminder": i.reminder,
                  })

    print(l)

    return JsonResponse({"status": "ok", "data": l})


def managetodolist(request):
    eventdate=request.POST["date"]
    reminder=request.POST["reminder"]
    uid=request.POST["lid"]

    obj2 = Eventplan()
    obj2.eventdate = eventdate
    obj2.reminder = reminder
    obj2.USER = User.objects.get(LOGIN_id=uid)
    obj2.save()
    return JsonResponse({"status": "ok"})

def sendappreview(request):
    lid=request.POST['lid']
    review = request.POST["review"]
    rating = request.POST['rating']


    obj=Appreview()
    obj.date=datetime.now()
    obj.review=review
    obj.rating=rating
    obj.USER = User.objects.get(LOGIN_id=lid)

    obj.save()
    return JsonResponse({"status": "ok"})

def viewappreview(request):
    r=Appreview.objects.all()
    l=[]
    for i in r:
        l.append({"id":i.id,
                  "date":i.date,
                  "review":i.review,
                  "rating":i.rating,
                  "user":i.USER.name})
    return JsonResponse({"status": "ok","data":l})

def sendvendorreview(request):
    lid=request.POST['lid']
    vid=request.POST['vd']
    review = request.POST["review"]
    rating = request.POST['rating']

    obj=Vendorreview()
    obj.date=datetime.now().today()
    obj.review=review
    obj.rating=rating
    obj.USER = User.objects.get(LOGIN_id=lid)
    obj.VENDOR_id = vid
    obj.save()

    print(vid)
    return JsonResponse({"status": "ok",})

def viewvendorreview(request):
    r=Vendorreview.objects.all()
    l=[]
    for i in r:
        l.append({"id":i.id,
                  "date":i.date,
                  "review":i.review,
                  "rating":i.rating,
                  "user":i.USER.name,
                  "vendor":i.VENDOR.vendorname})
    return JsonResponse({"status": "ok","data":l})
#
# def userviewvendor(request):
#     search=request.POST['search']
#     r = Vendor.objects.filter(vendorname__icontains=search)|Vendor.objects.filter(category__icontains=search)
#     l = []
#     for i in r:
#         l.append({"id": i.id,
#                   "vendorname": i.vendorname,
#                   "contactnumber":i.contactnumber,
#                   "photo":i.photo,
#                   "experience":i.experience,
#                   "email":i.email,
#                   "place":i.place,
#                   "post":i.post,
#                   "pin":i.pin,
#                   "category":i.category,
#                   "district":i.district})
#     return JsonResponse({"status": "ok","data":l})

def userviewvendor(request):
    search=request.POST['search']
    r = Vendor.objects.filter((Q(vendorname__icontains=search) | Q(category__icontains=search)) & Q(status='approve'))
    l = []
    for i in r:
        l.append({"id": i.id,
                  "vendorname": i.vendorname,
                  "contactnumber":i.contactnumber,
                  "photo":i.photo,
                  "experience":i.experience,
                  "email":i.email,
                  "place":i.place,
                  "post":i.post,
                  "pin":i.pin,
                  "category":i.category,
                  "district":i.district})
    return JsonResponse({"status": "ok","data":l})


def userviewblogs(request):
    r=Weddingblog.objects.all()
    l=[]
    for i in r:
        l.append({"id":i.id,
                  "filename":i.filename,
                  "description":i.description,
                  "video":i.video,
                  "date":i.date})

    return JsonResponse({"status": "ok","data":l})

def addbooking(request):
    lid = request.POST['lid']
    eventdate = request.POST["textfield"]
    service=request.POST["textfield2"]

    obj = Bookingrequest()
    obj.eventdatedate = eventdate
    obj.SERVICES_id = service
    obj= User.objects.get(LOGIN_id=lid)
    obj.save()
    return JsonResponse({"status": "ok"})

def userviewbooking(request):
    lid=request.POST['lid']
    r=Bookingrequest.objects.filter(USER__LOGIN_id=lid)
    l = []
    for i in r:
        l.append({"id": i.id,
                  "eventdate": i.eventdate,
                  "bookingstatus": i.status,
                  "service": i.SERVICES.servicename,
                  "amount": i.SERVICES.servicefees,



                  })

    print(l)
    return JsonResponse({"status":"ok","data":l})


def userviewvendorservice(request):
    vid=request.POST['vid']
    print(vid,'VID:')
    r=Services.objects.filter(VENDOR_id=vid)
    l = []
    for i in r:
        l.append({"id": i.id,
                  "servicename": i.servicename,
                  "photo": i.photo,
                  "servicefees": i.servicefees})

    print(l)
    return JsonResponse({"status":"ok","data":l})


def viewprofile(request):
    lid=request.POST['lid']
    r=User.objects.get(LOGIN_id=lid)
    return JsonResponse({"status":"ok",
                         "name":r.name,
                         "phone":r.phone,
                         "email":r.email,
                         "dob":r.dob,
                         "place":r.place,
                         "post":r.post,
                         "pin":r.pin,
                         "district":r.district,
                         "eventdate":r.eventdate,
                         "gender":r.gender,
                         "photo":r.photo})

def userpayment(request):
    bid=request.POST['bid']
    lid=request.POST['lid']
    amount=request.POST['amount']
    print(request.POST)

    obj=Paymentreports()
    obj.date=datetime.now().today()
    obj.USER=User.objects.get(LOGIN=lid)
    obj.REQUEST_id=bid
    obj.amount=amount
    obj.paymentstatus='paid'
    obj.save()
    return JsonResponse({"status":"ok"})

def addexpensedetails(request):
    lid=request.POST['lid']

    amount = request.POST['textfield2']
    narration = request.POST['textfield3']

    obj = Expensedetails()
    obj.date = datetime.now()
    obj.amount = amount
    obj.narration = narration
    obj.USER=User.objects.get(LOGIN_id=lid)
    obj.save()
    return JsonResponse({"status": "ok"})

def editexpensedetails(request):
    lid=request.POST['lid']
    date = request.POST["textfield"]
    amount = request.POST['textfield2']
    narration = request.POST['textfield3']

    obj = Expensedetails()
    obj.date = date
    obj.amount = amount
    obj.narration = narration
    obj.USER_id=User.objects.get(LOGIN_id=lid)
    obj.save()
    return JsonResponse({"status": "ok"})

def viewexpensedetails(request):
    lid=request.POST['lid']
    r=Expensedetails.objects.filter(USER__LOGIN_id=lid)

    l = []
    for i in r:
        l.append({"id": i.id,
                  "date": i.date,
                  "amount": i.amount,
                  "narration": i.narration})


    return JsonResponse({"status":"ok","data":l})

def viewtodolist(request):
    lid=request.POST['lid']
    r=Eventplan.objects.filter(USER__LOGIN_id=lid)

    l = []
    for i in r:
        l.append({"id": i.id,
                  "eventdate": i.eventdate,
                  "reminder": i.reminder})


    return JsonResponse({"status":"ok","data":l})



def sendcomplaints(request):
    lid=request.POST['lid']
    complaint = request.POST["complaint"]

    obj=Complaint()
    obj.date=datetime.now()
    obj.complaint=complaint
    obj.reply='pending'
    obj.status='pending'
    obj.USER=User.objects.get(LOGIN_id=lid)
    obj.save()
    return JsonResponse({"status": "ok"})

def viewreply(request):
    lid=request.POST['lid']
    r=Complaint.objects.filter(USER__LOGIN_id=lid)
    l = []
    for i in r:
        l.append({"id": i.id,
                  "date": i.date,
                  "complaint": i.complaint,
                  "reply": i.reply})

    print(l)

    return JsonResponse({"status":"ok","data":l})

def edit_user(request):
    lid=request.POST['lid']
    name=request.POST['name']
    phone=request.POST['phone']
    gender=request.POST['gender']
    email=request.POST['email']
    dob=request.POST['dob']
    place=request.POST['place']
    post=request.POST['post']
    pin=request.POST['pin']
    district=request.POST['district']
    eventdate=request.POST['eventdate']
    photo=request.POST['photo']

    u=User.objects.get(LOGIN_id=lid)

    if len(photo)>5:
        import base64
        date=datetime.now().strftime("%Y%m%d-%H%M%S")
        a=base64.b64decode(photo)
        fh=open("C:\\Users\\yahya vk\\PycharmProjects\\EVENTMNGMNT\\media\\"+date+".jpg","wb")
        path="/media/"+date+".jpg"
        u.photo = path
        fh.write(a)
        fh.close()
    u.name=name
    u.phone=phone
    u.gender=gender
    u.email=email
    u.dob=dob
    u.place=place
    u.post=post
    u.pin=pin
    u.district=district
    u.eventdate=eventdate

    u.save()

    return  JsonResponse(
        {
            'status':'ok'
        }
    )

def forgotpassword(request):
    email=request.POST['uname']
    res = Login.objects.filter(username=email)
    if res.exists():
        import random
        new_pass = random.randint(0000, 9999)
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login("eventmanagement665@gmail.com", "mnnd silx icry mvsr")  # App Password
        to = email
        subject = "Test Email"
        body = "Your new password is " + str(new_pass)
        msg = "Subject: {subject}\n\n{body}"
        server.sendmail("s@gmail.com", to, msg)
        # Disconnect from the server
        server.quit()
        ress = Login.objects.filter(username=email).update(password=new_pass)

    return JsonResponse(
        {
            'status': 'ok'
        }
    )




