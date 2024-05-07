"""employee_tracking URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from emp_app import views
urlpatterns = [
    path('',views.login),
    path('logout',views.logout),
    path('addhr',views.addhr),
    path('mnghr',views.mnghr),
    path('reply/<int:id>',views.reply),
    path('replycode',views.replycode),
    path('complaint2',views.complaint2),
    path('addimg',views.addimg),
    path('salary',views.salary),
    path('check',views.check),
    path('vstaff',views.vstaff),
    path('vwork',views.vwork),
    path('sattend',views.sattend),
    path('adsalary',views.adsalary),
    path('adwork',views.adwork),
    path('lv',views.lv),
    path('mngsalary',views.mngsalary),
    path('mngwork',views.mngwork),
    path('trackemp',views.trackemp),
    path('vda/<int:id>',views.vda),
    path('vta',views.vta),
    path('vreport',views.vreport),
    path('vworkstatus',views.vworkstatus),
    path('logincheck',views.logincheck),
    path('admin_home',views.admin_home),
    path('addhr1',views.addhr1),
    path('edithr/<int:id>',views.edithr),
    path('dlthr/<int:id>',views.dlthr),
    path('edithr1',views.edithr1),
    path('search_hr',views.search_hr),
    path('hr_home',views.hr_home),
    path('addstaff',views.addstaff),
    path('mngstaff',views.mngstaff),
    path('addstaff1',views.addstaff1),
    path('editstaff/<int:id>',views.editstaff),
    path('editstaff1',views.editstaff1),
    path('search_staff',views.search_staff),
    path('logincode',views.logincode),
    path('addwrk1',views.addwrk1),
    path('map',views.map),
    path('dltwrk/<int:id>',views.dltwrk),
    path('dltstaff/<int:id>',views.dltstaff),
    path('editwrk/<int:id>',views.editwrk),
    path('editwrk1',views.editwrk1),
    path('search_wrk2',views.search_wrk2),
    path('search_wrk',views.search_wrk),
    path('search_stafff',views.search_stafff),
    path('and_staff_view_work',views.and_staff_view_work),
    path('and_staff_update_work',views.and_staff_update_work),
    path('add_da',views.add_da),
    path('vda_ta/<int:id>',views.vda_ta),
    path('vda_ta_search',views.vda_ta_search),
    path('ta_locationins',views.ta_locationins),
    path('ta_locationins_stop_update',views.ta_locationins_stop_update),
    path('search_wrk1',views.search_wrk1),
    path('search_leave',views.search_leave),
    path('Accept_da/<int:id>',views.Accept_da),
    path('vda_taa/<int:id>',views.vda_taa),
    path('reject_da/<int:id>',views.reject_da),
    path('leave',views.leave),
    path('view_leave',views.view_leave),
    path('view_leave1',views.view_leave1),
    path('Accept_leave/<int:id>',views.Accept_leave),
    path('reject_leave/<int:id>',views.reject_leave),
    path('complaint1',views.complaint1),
    path('view_complaint',views.view_complaint),
    path('view_comp',views.view_comp),
    path('search_comp',views.search_comp),
    path('search_leave',views.search_leave),
    path('slryclctn',views.slryclctn),
    path('sal_calc',views.sal_calc),
    path('sattend',views.sattend),
    path('updatelocation',views.updatelocation),
    path('attendance1',views.attendance1),
    path('select_staff',views.select_staff),
    path('attendanceandroid',views.attendanceandroid),
    path('android_salary',views.android_salary),
    path('viewmoresalary/<int:id>',views.viewmoresalary),
]
