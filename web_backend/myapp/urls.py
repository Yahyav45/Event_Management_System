"""
URL configuration for EVENTMNGMNT project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from myapp import views


urlpatterns = [
    path('login/',views.login),
    path('login_post/',views.login_post),
    path('appreview/', views.appreview),
    path('appreview_post/', views.appreview_post),
    path('changepassword/',views.changepassword),
    path('changepassword_post/',views.changepassword_post),
    path('sendreply/<id>', views.sendreply),
    path('sendreply_post/', views.sendreply_post),
    path('vendorreview/', views.vendorreview),
    path('vendorreview_post/', views.vendorreview_post),
    path('viewapprovedvendors/', views.viewapprovedvendor),
    path('viewapprovedvendors_post/', views.viewapprovedvendor_post),
    path('viewcomplaints/', views.viewcomplaints),
    path('viewcomplaints_post/', views.viewcomplaints_post),
    path('viewrejectedvendors/', views.viewrejectedvendors),
    path('viewrejectedvendors_post/', views.viewrejectedvendors_post),
    path('viewusers/',views.viewusers),
    path('viewusers_post/',views.viewusers_post),
    path('viewvendor/', views.viewvendor),
    path('approve/<id>', views.approve),
    path('reject/<id>', views.reject),
    path('viewvendor_post/', views.viewvendor_post),
    path('addweddingblogs/', views.addweddingblogs),
    path('addweddingblogs_post/', views.addweddingblogs_post),
    path('editweddingblogs/<id>', views.editweddingblogs),
    path('editweddingblogs_post/', views.editweddingblogs_post),
    path('deleteweddingblogs/<id>', views.deleteweddingblogs),
    path('viewweddingblogs/', views.viewweddingblogs),
    path('viewweddingblogs_post/', views.viewweddingblogs_post),
    path('addgallery/', views.addgallery),
    path('addgallery_post/', views.addgallery_post),
    path('approvedbookingrequest/', views.approvedbookingrequest),
    path('approvedbookingrequest_post/', views.approvedbookingrequest_post),
    path('editvendorprofile/', views.editvendorprofile),
    path('editvendorprofile_post/', views.editvendorprofile_post),
    path('rejectedbookingrequest/', views.rejectedbookingrequest),
    path('rejectedbookingrequest_post/', views.rejectedbookingrequest_post),
    path('servicevendor/', views.servicevendor),
    path('servicevendor_post/', views.servicevendor_post),
    path('signupvendor/', views.signupvendor),
    path('signupvendor_post/', views.signupvendor_post),
    path('viewbookingrequest/', views.viewbookingrequest),
    path('viewbookingrequest_post/', views.viewbookingrequest_post),
    path('approvebookingrequest/<id>', views.approvebookingrequest),
    path('rejectbookingrequest/<id>', views.rejectbookingrequest),
    path('viewgallery/', views.viewgallery),
    path('viewgallery_post/', views.viewgallery_post),
    path('editgallery/<id>', views.editgallery),
    path('editgallery_post/', views.editgallery_post),
    path('viewprofilevendor/', views.viewprofilevendor),
    path('viewprofilevendor_post/', views.viewprofilevendor_post),
    path('viewreview/', views.viewreview),
    path('viewreview_post/', views.viewreview_post),
    path('viewservices/', views.viewservices),
    path('viewservices_post/', views.viewservices_post),
    path('editvendorservices/<id>', views.editvendorservices),
    path('editvendorservices_post/', views.editvendorservices_post),
    path('addwedding/', views.addwedding),
    path('addwedding_post/', views.addwedding_post),
    path('editwedding/<id>', views.editwedding),
    path('deletewedding/<id>', views.deletewedding),
    path('editwedding_post/', views.editwedding_post),
    path('vendor_viewweddingblogs/', views.vendor_viewweddingblogs),
    path('vendor_viewweddingblogs_post/', views.vendor_viewweddingblogs_post),
    path('adminhome/', views.adminhome),
    path('vendorhome/', views.vendorhome),
    path('deleteservices/<id>', views.deleteservices),
    path('deletegallery/<id>', views.deletegallery),
    path('viewpaymentreport/', views.viewpaymentreport),
    path('viewpaymentreport_post/', views.viewpaymentreport_post),

    path('user_loginpost/', views.user_loginpost),
    path('user_changepassword/', views.user_changepassword_post),
    path('signup_user/', views.signup_user),
    path('edituserprofile/', views.edituserprofile_post),
    path('setmarriagedate/', views.setmarriagedate),
    path('managetodolist/', views.managetodolist),
    path('sendappreview/', views.sendappreview),
    path('viewappreview/', views.viewappreview),
    path('sendvendorreview/', views.sendvendorreview),
    path('viewvendorreview/', views.viewvendorreview),
    path('userviewvendor/', views.userviewvendor),
    path('userviewblogs/', views.userviewblogs),
    path('addbooking/', views.addbooking),
    path('userviewbooking/', views.userviewbooking),
    path('viewprofile/', views.viewprofile),
    path('userpayment/', views.userpayment),
    path('addexpensedetails/', views.addexpensedetails),
    path('editexpensedetails/', views.editexpensedetails),
    path('viewexpensedetails/', views.viewexpensedetails),
    path('sendcomplaints/', views.sendcomplaints),
    path('viewreply/', views.viewreply),
    path('edit_user/', views.edit_user),
    path('viewtodolist/', views.viewtodolist),
    path('userviewvendorservice/', views.userviewvendorservice),
    path('forgotpassword/', views.forgotpassword),
    path('viewmarriagedate/', views.viewmarriagedate),
    path('termsandconditions/', views.termsandconditions),


]
