import json
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Sum, Q
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.shortcuts import render, redirect
from datetime import datetime
# Create your views here.
from emp_app.encode_faces import enf
from emp_app.models import *
# from geopy.distance import geodesic
from emp_app.recognize_face import rec_face_image


def login(request):
    return render(request,'loginindex.html')


def logout(request):
    auth.logout(request)
    return render(request,'loginindex.html')


def main(request):
    return render(request,'mainindex.html')
def logincheck(request):
    uname=request.POST['textfield']
    pswd=request.POST['textfield2']
    try:
        ob=login_table.objects.get(username=uname,password=pswd)
        if ob.type == "admin":
            ob1=auth.authenticate(username="admin",password="admin")
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("welcome");window.location='/admin_home'</script>''')
        elif ob.type == "hr":
            ob1=auth.authenticate(username="admin",password="admin")
            if ob1 is not None:
                auth.login(request, ob1)

            request.session['lid'] = ob.id
            return HttpResponse('''<script>alert("welcome");window.location='/hr_home'</script>''')
        elif ob.type == "staff":
            ob1=auth.authenticate(username="admin",password="admin")
            if ob1 is not None:
                auth.login(request, ob1)

            request.session['lid']=ob.id
            return HttpResponse('''<script>alert("welcome");window.location='/expert_homepage'</script>''')
        elif ob.type == "agency":
            ob1=auth.authenticate(username="admin",password="admin")
            if ob1 is not None:
                auth.login(request, ob1)

            request.session['lid']=ob.id
            return HttpResponse('''<script>alert("welcome");window.location='/add_homepage'</script>''')
        else:
            return HttpResponse('''<script>alert("invalid username or password");window.location='/'</script>''')
    except Exception as e:
        print(e)
        return HttpResponse('''<script>alert("invalid username or password");window.location='/'</script>''')


@login_required(login_url="/")
def admin_home(request):
    return render(request,'admin/adminindex.html')

@login_required(login_url="/")
def addhr(request):
    return render(request,'admin/add hr.html')

@login_required(login_url="/")
def addhr1(request):
    fname = request.POST['textfield']
    lname = request.POST['textfield2']
    place = request.POST['textfield3']
    post = request.POST['textfield4']
    pin = request.POST['textfield5']
    dob = request.POST['textfield82']
    gender = request.POST['radiobutton']
    phno = request.POST['textfield8']
    email = request.POST['textfield7']
    photo = request.FILES['file']
    fs = FileSystemStorage()
    fsave = fs.save(photo.name, photo)
    username = request.POST['textfield10']
    password = request.POST['textfield11']
    ob = login_table()
    ob.username = username
    ob.password = password
    ob.type = 'hr'
    ob.save()
    obu = hr_table()
    obu.fname = fname
    obu.lname = lname
    obu.place = place
    obu.post = post
    obu.pin = pin
    obu.dob = dob
    obu.gender = gender
    obu.phno = phno
    obu.email = email
    obu.photo = fsave
    obu.LOGIN = ob
    obu.save()
    return HttpResponse('''<script>alert("Added");window.location='/mnghr'</script>''')


@login_required(login_url="/")
def search_hr(request):
    name=request.POST['textfield']
    ob=hr_table.objects.filter(fname__istartswith=name)
    return render(request, 'admin/mng hr.html',{'val':ob})

@login_required(login_url="/")
def mnghr(request):
    ob=hr_table.objects.all()
    return render(request,'admin/mng hr.html',{'val':ob})

@login_required(login_url="/")
def reply(request,id):
    request.session["coid"]=id
    ob=complaint.objects.get(id= request.session["coid"])
    return render(request,'admin/reply.html',{"i":ob})

@login_required(login_url="/")
def replycode(request):
    rep=request.POST['textarea']
    ob=complaint.objects.get(id=request.session["coid"])
    ob.reply=rep
    ob.save()
    return HttpResponse('''<script>alert("Replied");window.location='/view_comp'</script>''')

@login_required(login_url="/")
def complaint2(request):
    return render(request,'admin/send complaint and view reply.html')

@login_required(login_url="/")
def select_staff(request):
    ob = staff_table.objects.all()
    return render(request,'admin/select staff.html', {'val': ob,'v':0})



@login_required(login_url="/")
def attendance1(request):
    print(request.POST)
    obr = staff_table.objects.all()
    # s_id = request.POST['select']
    # mnth=request.POST['mnth']
    year = int(request.POST["year"])
    mon = int(request.POST["month"])  # March
    lid = request.POST["select"]  # March
    ob = staff_table.objects.all()

    print(year,mon)
    # mon = 0
    # if month == "January":
    #     mon = 1
    # elif month == "February":
    #     mon = 2
    # elif month == "March":
    #     mon = 3
    # elif month == "April":
    #     mon = 4
    # elif month == "May":
    #     mon = 5
    # elif month == "June":
    #     mon = 6
    # elif month == "July":
    #     mon = 7
    # elif month == "August":
    #     mon = 8
    # elif month == "September":
    #     mon = 9
    # elif month == "October":
    #     mon = 10
    # elif month == "November":
    #     mon = 11
    # else:
    #     mon = 12

    year = year
    month = mon
    dates = get_datesfn(year,month)
    print("Dates in March 2024:",dates)
    data = []
    for date in dates:
        print(date)
        ob = attendance.objects.filter(staff__id=lid,date__iexact=date)
        print(date,"---------------------------",lid)
        if len(ob) > 0:
            row = {"Date": date, "Attendance": "present"}
        else:
            st = datetime.datetime.strptime(date, "%Y-%m-%d")
            if st > datetime.datetime.today():
                row = {"Date": date, "Attendance": "Waiting"}
            else:
                row = {"Date": date, "Attendance": "absent"}
        data.append(row)
    print(data,"Hhhhhhhhhhhhhhhhhhhhh")
    return render(request, 'admin/select staff.html',{"val1": data,'val': obr,"sid":int(lid),"mnth":str(month),"yr":str(year)})

    # r = json.dumps(data)
    # print(r)
    # return HttpResponse(r)


import calendar

def get_datesfn(year, month):
    _, num_days = calendar.monthrange(year, month)
    dates = [f"{year}-{month:02d}-{day:02d}" for day in range(1, num_days + 1)]
    return dates



    # data=[]
    # ob1=attendance.objects.filter(staff__id=s_id,date__month=mnth)
    # for i in ob1:
    #     ob = attendance.objects.filter(staff__id=s_id, date__month=mnth,work__id=i.work.id).aggregate(
    #         sum_present=Sum("attendance"))
    #     print(ob, "=================================")
    #     row={"work":i.work.work.work,"pd":ob['sum_present']}
    #     data.append(row)
    return render(request,'admin/select staff.html',{'val': obb,'val1':data,'sid':int(s_id),'mnth':mnth})




@login_required(login_url="/")
def salary(request):
    return render(request,'admin/view salary info and verify.html')


@login_required(login_url="/")
def vstaff(request):
    ob=staff_table.objects.all()
    return render(request,'admin/view staff.html',{'val':ob})


@login_required(login_url="/")
def search_stafff(request):
    name=request.POST['textfield']
    ob=staff_table.objects.filter(fname__istartswith=name)
    return render(request, 'admin/view staff.html',{'val':ob})


@login_required(login_url="/")
def vwork(request):
    ob=assign_work_table.objects.filter()
    return render(request,'admin/view work status.html',{'val':ob})


@login_required(login_url="/")
def search_wrk2(request):
    date=request.POST['textfield']
    name = request.POST['textfield2']
    ob = assign_work_table.objects.filter(Q(date=date)|Q(work__work__istartswith=name)|Q(status__istartswith=name)|Q(staff__fname__istartswith=name))
    return render(request, 'admin/view work status.html', {'val': ob})


@login_required(login_url="/")
def edithr(request,id):
    request.session['hid']=id
    ob=hr_table.objects.get(id=id)
    return render(request,'admin/edithr.html',{'val':ob,'date':str(ob.dob)})


@login_required(login_url="/")
def edithr1(request):
    try:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        place = request.POST['textfield3']
        post = request.POST['textfield4']
        pin = request.POST['textfield5']
        dob = request.POST['textfield82']
        gender = request.POST['radiobutton']
        phno = request.POST['textfield8']
        email = request.POST['textfield7']
        photo = request.FILES['file']
        fs = FileSystemStorage()
        fsave = fs.save(photo.name, photo)

        obu = hr_table.objects.get(id=request.session['hid'])
        obu.fname = fname
        obu.lname = lname
        obu.place = place
        obu.post = post
        obu.pin = pin
        obu.dob = dob
        obu.gender = gender
        obu.phno = phno
        obu.email = email
        obu.photo = fsave

        obu.save()
    except:

        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        place = request.POST['textfield3']
        post = request.POST['textfield4']
        pin = request.POST['textfield5']
        dob = request.POST['textfield82']
        gender = request.POST['radiobutton']
        phno = request.POST['textfield8']
        email = request.POST['textfield7']


        obu = hr_table.objects.get(id=request.session['hid'])
        obu.fname = fname
        obu.lname = lname
        obu.place = place
        obu.post = post
        obu.pin = pin
        obu.dob = dob
        obu.gender = gender
        obu.phno = phno
        obu.email = email

        obu.save()

    return HttpResponse('''<script>alert("Added");window.location='/mnghr'</script>''')


@login_required(login_url="/")
def dlthr(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="Resigned"
    ob.save()
    return HttpResponse('''<script>alert("Resigned");window.location='/mnghr'</script>''')



@login_required(login_url="/")
def mngstaff(request):
    ob = staff_table.objects.all()
    return render(request,'hr/mngstaff.html',{'val':ob})




@login_required(login_url="/")
def search_staff(request):
    name=request.POST['textfield']
    ob=staff_table.objects.filter(fname__istartswith=name)
    return render(request, 'hr/mngstaff.html',{'val':ob})

@login_required(login_url="/")
def addstaff(request):
    return render(request,'hr/add staff.html')




@login_required(login_url="/")
def addstaff1(request):
    fname = request.POST['textfield']
    lname = request.POST['textfield2']
    place = request.POST['textfield3']
    post = request.POST['textfield4']
    pin = request.POST['textfield5']
    dob = request.POST['textfield82']
    gender = request.POST['radiobutton']
    phno = request.POST['textfield8']
    email = request.POST['textfield7']
    photo = request.FILES['file']
    fs = FileSystemStorage()
    fsave = fs.save(photo.name, photo)
    username = request.POST['textfield10']
    password = request.POST['textfield11']
    ob = login_table()
    ob.username = username
    ob.password = password
    ob.type = 'staff'
    ob.save()


    obu = staff_table()
    obu.fname = fname
    obu.lname = lname
    obu.place = place
    obu.post = post
    obu.pin = pin
    obu.dob = dob
    obu.gender = gender
    obu.phno = phno
    obu.email = email
    obu.photo = fsave
    obu.LOGIN = ob
    obu.save()
    return HttpResponse('''<script>alert("Added");window.location='/mngstaff'</script>''')





@login_required(login_url="/")
def editstaff(request,id):
    request.session['hid']=id
    ob=staff_table.objects.get(id=id)
    return render(request,'hr/editstaff.html',{'val':ob,'date':str(ob.dob)})


@login_required(login_url="/")
def editstaff1(request):
    try:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        place = request.POST['textfield3']
        post = request.POST['textfield4']
        pin = request.POST['textfield5']
        dob = request.POST['textfield82']
        gender = request.POST['radiobutton']
        phno = request.POST['textfield8']
        email = request.POST['textfield7']
        photo = request.FILES['file']
        fs = FileSystemStorage()
        fsave = fs.save(photo.name, photo)
        obu = staff_table.objects.get(id=request.session['hid'])
        obu.fname = fname
        obu.lname = lname
        obu.place = place
        obu.post = post
        obu.pin = pin
        obu.dob = dob
        obu.gender = gender
        obu.phno = phno
        obu.email = email
        obu.photo = fsave
        obu.save()
    except:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        place = request.POST['textfield3']
        post = request.POST['textfield4']
        pin = request.POST['textfield5']
        dob = request.POST['textfield82']
        gender = request.POST['radiobutton']
        phno = request.POST['textfield8']
        email = request.POST['textfield7']
        obu = staff_table.objects.get(id=request.session['hid'])
        obu.fname = fname
        obu.lname = lname
        obu.place = place
        obu.post = post
        obu.pin = pin
        obu.dob = dob
        obu.gender = gender
        obu.phno = phno
        obu.email = email
        obu.save()

    return HttpResponse('''<script>alert("Added");window.location='/mngstaff'</script>''')


@login_required(login_url="/")
def dltstaff(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="Resigned"
    ob.save()
    return HttpResponse('''<script>alert("Resigned");window.location='/mngstaff'</script>''')






@login_required(login_url="/")
def adsalary(request):
    return render(request,'hr/add salary.html')

@login_required(login_url="/")
def adwork(request):
    ob=staff_table.objects.all()
    return render(request,'hr/add work.html',{"val":ob})




@login_required(login_url="/")
def addwrk1(request):

    work = request.POST['textfield']
    staff = request.POST['select']
    description = request.POST['textfield2']
    # status = request.POST['textfield3']
    date = request.POST['textfield4']
    # latitude = request.POST['textfield5']
    # longitude = request.POST['textfield6']
    plan = request.FILES['file']
    fs=FileSystemStorage()
    fn=fs.save(plan.name,plan)
    client = request.POST['textfield7']
    ob = assign_work_table.objects.filter(date=date, staff__id=staff)
    if len(ob)==0:
        # email = request.POST['textfield7']
        # photo = request.FILES['file']
        # fs = FileSystemStorage()
        # fsave = fs.save(photo.name, photo)
        # username = request.POST['textfield10']
        # password = request.POST['textfield11']
        # ob = login_table()
        # ob.username = username
        # ob.password = password
        # ob.type = 'staff'
        # ob.save()
        obu = work_table()
        obu.hr=hr_table.objects.get(LOGIN__id=request.session['lid'])
        obu.work = work
        obu.description = description
        obu.status = "pending"
        obu.date = date
        obu.latitude = 0
        obu.longitude = 0
        obu.plan = fn
        obu.client = client
        # obu.email = email
        # obu.photo = fsave
        # obu.LOGIN = ob
        obu.save()
        oba=assign_work_table()
        oba.staff=staff_table.objects.get(id=staff)
        oba.work=obu
        oba.date=datetime.datetime.today()
        oba.status="pending"
        oba.save()
        request.session['wid']=obu.id
    else:
        return HttpResponse('''<script>alert("Already assigned");window.location='/mngwork'</script>''')
    return render(request,"hr/map.html")






@login_required(login_url="/")
def dltwrk(request,id):
    ob=work_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("delete");window.location='/mngwork'</script>''')


@login_required(login_url="/")
def editwrk(request,id):
    print(id,"============")
    request.session['woid']=id
    ob=work_table.objects.get(id=id)
    oj=staff_table.objects.all()
    print(ob,"------------")
    return render(request,'hr/editwrk.html',{'val':ob,'val1':oj,'dt':str(ob.date)})




@login_required(login_url="/")
def editwrk1(request):
    try:
        work = request.POST['textfield']
        staff = request.POST['select']
        description = request.POST['textfield2']
        # status = request.POST['textfield3']
        date = request.POST['textfield4']
        plan = request.FILES['file']
        fs = FileSystemStorage()
        fn = fs.save(plan.name, plan)
        client = request.POST['textfield7']
        ob = assign_work_table.objects.filter(work__date=date, staff__id=staff)
        if len(ob) == 0:

            obu = work_table.objects.get(id=request.session['woid'])
            obu.work = work
            obu.description = description
            # obu.status = status
            obu.date = date
            obu.plan = fn
            obu.client = client
            obu.save()
            oba=assign_work_table.objects.get(work__id=request.session['woid'])
            oba.staff = staff_table.objects.get(id=staff)
            oba.work = obu
            oba.date = datetime.datetime.today()
            oba.status = "pending"
            oba.save()
            request.session['wid'] = obu.id
            return HttpResponse('''<script>alert("updated");window.location='/mngwork'</script>''')

    except Exception as e:
        print(e)
        work = request.POST['textfield']
        staff = request.POST['select']
        description = request.POST['textfield2']
        # status = request.POST['textfield3']
        date = request.POST['textfield4']
        client = request.POST['textfield7']
        print(date,staff,"============================555555555555555")
        ob = assign_work_table.objects.filter(work__date=date, staff__id=staff)
        if len(ob) == 0:
            obu = work_table.objects.get(id=request.session['woid'])
            obu.work = work
            obu.description = description
            # obu.status = status
            obu.date = date
            obu.client = client
            obu.save()
            oba=assign_work_table.objects.get(work__id=request.session['woid'])
            oba.staff=staff_table.objects.get(id=staff)
            oba.date=datetime.datetime.today()
            oba.status="pending"
            oba.save()
            request.session['wid']=obu.id
            return HttpResponse('''<script>alert("updated");window.location='/mngwork'</script>''')
    return HttpResponse('''<script>alert("can't update,staff already has work on this date");window.location='/mngwork'</script>''')











@login_required(login_url="/")
def map(request):
    lat=request.POST['lat']
    lon=request.POST['lon']
    obu=work_table.objects.get(id=request.session['wid'])
    obu.latitude = lat
    obu.longitude = lon
    obu.save()
    return HttpResponse('''<script>alert("Added");window.location='/mngwork'</script>''')

@login_required(login_url="/")
def lv(request):
    ob = work_table.objects.all().order_by('-id')
    for i in ob:
        try:
            oba = assign_work_table.objects.get(work__id=i.id)
            i.sname = oba.staff.fname + " " + oba.staff.lname
            i.status=oba.status
            i.aid=oba.id
            i.statusdate=oba.date
        except:
            i.sname = "na"
            i.status = "na"
            i.aid = "na"
            i.statusdate="na"
    return render(request,'hr/view work status.html',{'val':ob})





@login_required(login_url="/")
def search_wrk1(request):
    date=request.POST['textfield']
    name=request.POST['textfield2']
    if date == "":
        ob = work_table.objects.filter(Q(work__istartswith=name)|Q(status__istartswith=name)|Q(client__istartswith=name)).order_by('-id')
    elif name == "":
        ob = work_table.objects.filter(date=date).order_by('-id')

    else:
        ob = work_table.objects.filter(Q(date=date),Q(work__istartswith=name)|Q(status__istartswith=name)|Q(client__istartswith=name)).order_by('-id')


    for i in ob:
        try:
            oba = assign_work_table.objects.get(work__id=i.id)
            i.sname = oba.staff.fname + " " + oba.staff.lname
            i.status=oba.status
            i.aid=oba.id
        except:
            i.sname = "na"
            i.status = "na"
            i.aid = "na"
    return render(request,'hr/view work status.html',{'val':ob})



@login_required(login_url="/")
def mngsalary(request):
    return render(request,'hr/manage salary details.html')


@login_required(login_url="/")
def mngwork(request):
    ob = work_table.objects.all().order_by('-id')
    for i in ob:
        try:
            oba=assign_work_table.objects.get(work__id=i.id)
            i.sname=oba.staff.fname+" "+oba.staff.lname
            i.status=oba.status

        except:
            i.sname="na"
            i.status="no"
    return render(request,'hr/mng work.html',{'val':ob})


@login_required(login_url="/")
def search_wrk(request):
    date=request.POST['textfield']
    name = request.POST['textfield2']
    ob = work_table.objects.filter(Q(date=date) | Q(work__istartswith=name)  | Q(client__istartswith=name)).order_by('-id')
    for i in ob:
        try:
            oba = assign_work_table.objects.get(work__id=i.id)
            i.sname = oba.staff.fname + " " + oba.staff.lname
            i.status=oba.status
            i.aid=oba.id
        except:
            i.sname = "na"
            i.status = "na"
            i.aid = "na"
    return render(request,'hr/mng work.html',{'val':ob})

@login_required(login_url="/")
def hr_home(request):
    return render(request,'hr/hrindex.html')


@login_required(login_url="/")
def view_leave1(request):
    ob=leave_table.objects.all()
    return render(request,'hr/approve or reject request.html',{'val':ob})

@login_required(login_url="/")
def search_leave(request):
    name=request.POST['textfield']
    ob=leave_table.objects.filter(fname__istartswith=name)
    return render(request, 'hr/approve or reject request.html',{'val':ob})

# def sendreply(request,id):
#     request.session['ddid']=id
#     return render(request, 'admin/send complaint and view reply.html')

#
# def senddoubtreply(request):
#     reply=request.POST['textarea']
#     ob=doubt_table.objects.get(id=request.session['ddid'])
#     ob.reply=reply
#     ob.save()
#     return HttpResponse('''<script>window.location="/view_comp#about"</script>''')




@login_required(login_url="/")
def view_comp(request):
    ob=complaint.objects.all().order_by('-id')
    return render(request,'admin/send complaint and view reply.html',{'val':ob})

@login_required(login_url="/")
def search_comp(request):
    name=request.POST['textfield']
    ob = complaint.objects.filter(date=name).order_by('-id')
    return render(request, 'admin/send complaint and view reply.html', {'val': ob})

@login_required(login_url="/")
def Accept_leave(request,id):
    ob = leave_table.objects.get(id=id)
    ob.status = "accepted"
    ob.save()
    return HttpResponse('''<script>alert("leave accepted");window.location='/view_leave1'</script>''')

@login_required(login_url="/")
def reject_leave(request,id):
    ob = leave_table.objects.get(id=id)
    ob.status = "rejected"
    ob.save()
    return HttpResponse('''<script>alert("leave rejected");window.location='/view_leave1'</script>''')

@login_required(login_url="/")
def search_leave(request):
    name=request.POST['textfield']
    ob=leave_table.objects.filter(staff__fname__istartswith=name)
    return render(request, 'hr/approve or reject request.html',{'val':ob})

@login_required(login_url="/")
def trackemp(request):
    obb=assign_work_table.objects.filter()
    return render(request,'hr/view work status.html')

@login_required(login_url="/")
def vda(request,id):
    obb=da_table.objects.filter(id=id)
    return render(request,'hr/view more DA.html',{'val':obb})

@login_required(login_url="/")
def vta(request):
    return render(request,'hr/view more TA.html')

@login_required(login_url="/")
def vreport(request):
    return render(request,'hr/view work status.html')

@login_required(login_url="/")
def vworkstatus(request):
    return render(request,'hr/view work status.html')

@login_required(login_url="/")
def vda_ta(request,id):
    ob=da_table.objects.filter(assign__id=id)
    print(ob,"gjjjjjjjjjjjj")
    return render(request,'hr/view TA and DA report.html',{"oos":ob})

@login_required(login_url="/")
def vda_taa(request,id):
    ob=ta.objects.filter(assignwork=id)
    return render(request,'hr/view TA.html',{"oos":ob})

@login_required(login_url="/")
def Accept_da(request,id):
    ob = da_table.objects.get(id=id)
    ob.status = "accepted"
    ob.save()
    return HttpResponse('''<script>alert("DA accepted");window.location='/lv'</script>''')

@login_required(login_url="/")
def reject_da(request,id):
    ob = da_table.objects.get(id=id)
    ob.status = "rejected"
    ob.save()
    return HttpResponse('''<script>alert("DA rejected");window.location='/lv'</script>''')


@login_required(login_url="/")
def vda_ta_search(request):
    staff=request.POST['select2']
    type=request.POST['select']
    ob=staff_table.objects.all()
    print(ob)
    if type == "DA":
        o=da_table.objects.filter(staff__id=staff)
    else:
        o=ta.objects.filter(staff__id=staff)

    return render(request,'hr/view TA and DA report.html',{"oos":ob,"val":o,"type":type})


@login_required(login_url="/")
def slryclctn(request):
    # ob = attendance_table.objects.filter(staff__hr=hr_table.objects.get(login=request.session["lid"]))
    # , {'val': ob}
    return render(request,'hr/salary.html')


@login_required(login_url="/")
def sal_calc(request):
    # ob = attendance_table.objects.filter(staff__hr=hr_table.objects.get(login=request.session["lid"]))
    # , {'val': ob}
    yy=datetime.datetime.now().strftime("%Y")
    mm=datetime.datetime.now().strftime("%m")

    y=request.POST['y']
    m=request.POST['m']
    request.session['m']=m
    request.session['y']=y
    print(y,yy,m,mm)
    if str(y)==str(yy) and str(m)==str(mm):
        return HttpResponse('''<script>alert("Invalid Details");window.location='/slryclctn'</script>''')

    ob=attendance.objects.filter(date__year=y,date__month=m).order_by('date')
    distdate=[]
    for i in ob:
        if i.date not in distdate:
            distdate.append(i.date)
    # for i in distdate:
    #     oba=attendance.objects.filter(date=i)
    #     distuser=[]
    #     for j in oba:
    #         distuser.append(j.staff.id)
    #     obab=staff_table.objects.exclude(id__in=distuser)
    #     for j in obab:
    #         print(j)
    #         # oba=attendance()
    #         # oba.staff=j
    #         # oba.date=i
    #         # oba.attendance=0
    #         # oba.image=0
    #         # oba.time=2
    #         # oba.work=assign_work_table.objects.get(id=1)
    #         # oba.save()
    ob=staff_table.objects.all()

    for i in ob:
        oba=attendance.objects.filter(date__year=y,date__month=m,staff_id=i.id,attendance=1)
        ta_amount=0
        da_amount=0
        for j in oba:
            obta=ta.objects.filter(assignwork__id=j.work.id)
            for k in obta:
                ta_amount+=k.amount
            obda=da_table.objects.filter(assign__id=j.work.id,status='accepted')
            for k in obda:
                da_amount+=k.amount

        p=len(oba)/len(distdate)
        ms=int(43200)*p
        ms=ms+ta_amount+da_amount
        p=round(p*100,1)
        i.twd=len(distdate)
        i.tpd=len(oba)
        i.per=p
        i.ms=int(ms)
    return render(request,'hr/salary.html',{"val":ob,"m":m,"y":y})


@login_required(login_url="/")
def viewmoresalary(request,id):
    # ob = attendance_table.objects.filter(staff__hr=hr_table.objects.get(login=request.session["lid"]))
    # , {'val': ob}

    m=request.session['m']
    y=request.session['y']
    ob=attendance.objects.filter(date__year=y,date__month=m).order_by('date')
    distdate=[]
    for i in ob:
        if i.date not in distdate:
            distdate.append(i.date)
    # for i in distdate:
    #     oba=attendance.objects.filter(date=i)
    #     distuser=[]
    #     for j in oba:
    #         distuser.append(j.staff.id)
    #     obab=staff_table.objects.exclude(id__in=distuser)
    #     for j in obab:
    #         print(j)
    #         # oba=attendance()
    #         # oba.staff=j
    #         # oba.date=i
    #         # oba.attendance=0
    #         # oba.image=0
    #         # oba.time=2
    #         # oba.work=assign_work_table.objects.get(id=1)
    #         # oba.save()

    ob=staff_table.objects.filter(id=id)
    ta_amount = 0
    da_amount = 0
    for i in ob:
        oba=attendance.objects.filter(date__year=y,date__month=m,staff_id=i.id,attendance=1)

        for j in oba:
            obta=ta.objects.filter(assignwork__id=j.work.id)
            for k in obta:
                ta_amount+=k.amount
            obda=da_table.objects.filter(assign__id=j.work.id,status='accepted')
            for k in obda:
                da_amount+=k.amount

        p=len(oba)/len(distdate)
        ms=int(43200)*p
        red=43200-ms
        p=p*100
        i.twd=len(distdate)
        i.tpd=len(oba)
        i.per=p
        i.red=red
        i.ms=int(ms)
        tms = ms + ta_amount + da_amount
        i.tms=tms
    return render(request,'hr/view_more_salary.html',{"i":ob[0],"ta":ta_amount,"da":da_amount})

#
# def viewmoresalary(request,id):
#     obb=assign_work_table.objects.filter(staff__id=id)
#     amt=0
#     for i in obb:
#         ob=ta.objects.filter(assignwork__id=i.id,date__month=request.session['m'])
#         for j in ob:
#             amt=amt+j.amount
#
#     return render(request,"hr/view_more_salary.html")





"=========================android==============================="

def logincode(request):
    print(request.POST)
    un = request.POST['uname']
    pwd = request.POST['pswd']
    print(un, pwd)
    try:
        users = login_table.objects.get(username=un, password=pwd)

        if users is None:
            data = {"task": "invalid"}
        else:
            print("in user function")
            obu=staff_table.objects.get(LOGIN__id=users.id)
            data = {"task": "valid", "id": users.id,'type':users.type,"ph":obu.photo.url}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except Exception as e:
        print(e)
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)



def and_staff_view_work(request):
    print(request.POST)
    lid = request.POST['lid']
    ob=assign_work_table.objects.filter(staff__LOGIN__id=lid)
    data=[]
    for i in ob:
        # work, description, date, lat, longitude, plan, client, aid
        r={"aid":i.id,"work":i.work.work,"description":i.work.description,"date":str(i.work.date),"lat":i.work.latitude,"longitude":i.work.longitude,"plan":i.work.plan.url,"client":i.work.client}
        data.append(r)
    d = json.dumps(data)
    print(d)
    return HttpResponse(d)


def and_staff_update_work(request):
    aid = request.POST['aid']
    status = request.POST['status']
    ob=assign_work_table.objects.get(id=aid)
    ob.status=status
    ob.date=datetime.datetime.today()
    ob.save()
    return JsonResponse({"task":"valid"})
def add_da(request):
    expense = request.POST['exp']
    amount = request.POST['amt']
    bill = request.FILES['file']
    lid=request.POST['lid']
    aid=request.POST['aid']
    fn=FileSystemStorage()
    fs=fn.save(bill.name,bill)
    ob = da_table()
    ob.expense=expense
    ob.amount=amount
    ob.staff=staff_table.objects.get(LOGIN__id=lid)
    ob.assign=assign_work_table.objects.get(id=aid)
    ob.bill=fs
    ob.date=datetime.datetime.today()
    ob.status='pending'
    ob.save()
    return JsonResponse({"task": "success"})

import datetime
def ta_locationins(request):
    lid = request.POST["lid"]
    lat = request.POST["lat"]
    lon = request.POST["lon"]
    obu=ta_location.objects.filter(staff__LOGIN__id=lid,date=datetime.datetime.today())
    if len(obu)>0:
        obu=obu[0]
    else:
        obu = ta_location()
    obu.from_latitude = lat
    obu.from_longitude = lon
    obu.staff=staff_table.objects.get(LOGIN=lid)

    obu.time = datetime.datetime.now()
    obu.date = datetime.datetime.today()
    obu.save()
    return JsonResponse({"task": "valid","id":obu.id})
import math

from math import radians, sin, cos, sqrt, atan2
def haversine(lat1, lon1, lat2, lon2):
    # Convert latitude and longitude from degrees to radians
    # lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])

    # Haversine formula
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    a = sin(dlat / 2) ** 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) ** 2
    try:
        c = 2 * atan2(sqrt(a), sqrt(1 - a))
    except:
        c= 1+(sqrt(a))



    # Calculate the distance
    distance =  c
    return distance
def ta_locationins_stop_update(request):
    lid = request.POST["lid"]
    lat = request.POST["lat"]
    lon = request.POST["lon"]
    try:
        point2 = (float(lat), float(lon))
    except Exception as e:
        print(e)
        lat = 11.2577656
        lon = 75.7844949
        point2 = ((lat* math.pi) / 180, (lon* math.pi) / 180)

    print(request.POST)
    obu = ta_location.objects.get(staff__LOGIN__id=lid,date=datetime.datetime.today())
    obu.to_latitude = lat
    obu.to_longitude = lon
    ob = assign_work_table.objects.filter(date=datetime.datetime.today(), staff__LOGIN__id=lid)
    if len(ob)>0:
        print(obu.from_latitude)
        print(obu.from_latitude)
        # Define the coordinates of the two points (latitude, longitude)
        point1 = ((float(obu.from_latitude)* math.pi) / 180, (float(obu.from_latitude)* math.pi) / 180)
        # Calculate the distance between the two points
        distance = haversine(point1[0],point1[1],point2[0],point2[1])
        amount=str(distance*15).split(".")[0]
        print("Distance between the two points:", distance, "kilometers")
        obta=ta()
        obta.assignwork=ob[0]
        obta.login_latitude=lat
        obta.login_longitude=lon
        obta.distance=distance
        obta.amount=amount
        obta.status='pending'
        obta.date=datetime.datetime.today()
        obta.save()
    obu.save()
    return JsonResponse({"task": "valid","id":obu.id})


def leave(request):
    from_date = request.POST['dt']
    no_of_days = request.POST['dt1']
    sid = request.POST['lid']
    reason = request.POST['reason']
    ob=leave_table()
    ob.staff=staff_table.objects.get(LOGIN__id=sid)
    ob.from_date=from_date
    ob.date=datetime.datetime.now()
    ob.status='pending'
    ob.no_of_days=no_of_days
    ob.reason=reason
    ob.save()
    return JsonResponse({"task": "valid"})
def updatelocation(request):
    lid=request.POST['lid']
    lati=request.POST['lat']
    longi=request.POST['lon']
    ob=location_table.objects.filter(LOGIN__id=lid)
    if len(ob)==0:
        ob=location_table()
        ob.latitude=lati
        ob.longitude=longi
        ob.LOGIN=login_table.objects.get(id=lid)
        ob.save()
        return JsonResponse({'task':'ok'})
    else:
        ob = location_table.objects.get(LOGIN__id=lid)
        ob.latitude = lati
        ob.longitude = longi
        ob.save()
        return JsonResponse({'task':'ok'})


def complaint1(request):
    complaints = request.POST['complaint']
    # date = request.POST['complaint']
    sid = request.POST['lid']
    # reason = request.POST['reason']
    ob=complaint()
    ob.staff=staff_table.objects.get(LOGIN__id=sid)
    ob.complaint=complaints
    ob.reply='pending'
    ob.date=datetime.datetime.now()
    ob.save()
    return JsonResponse({"task": "valid"})

def view_leave(request):
    lid=request.POST['lid']
    ob=leave_table.objects.filter(staff__LOGIN__id=lid)
    data=[]
    for i in ob:
        r={'reqdate':str(i.date),'nod':str(i.no_of_days),'fd':str(i.from_date),'reason':i.reason,'sts':i.status}
        data.append(r)
    d = json.dumps(data)
    print(d)
    return HttpResponse(d)

def view_complaint(request):
    lid=request.POST['lid']
    ob=complaint.objects.filter(staff__LOGIN__id=lid).order_by('-id')
    data=[]
    for i in ob:
        r={'date':str(i.date),'com':str(i.complaint),'reply':str(i.reply),'id':i.id}
        data.append(r)
    d = json.dumps(data)
    print(d)
    return HttpResponse(d)

def check(request):
    from datetime import datetime
    lid=request.POST['lid']
    ob=attendance.objects.filter(staff__LOGIN__id=lid,date=datetime.today())
    # qry = "SELECT * FROM `staff_attendance` WHERE `sid`=%s AND `date`=CURDATE()"
    # s = selectone(qry, lid)
    if len(ob)==0:
            return JsonResponse({"task": "success"})
    else:
            return JsonResponse({"task": "Attendance already marked today"})

def addimg(request):
    try:
        print(request.POST,"====================================================")
        img=request.FILES['files']
        lid=request.POST['lid']
        print(lid,img,"=======================")
        fnn=FileSystemStorage()
        import time
        # fn=time.strftime("%Y%m%d_%H%M%S")+".jpg"
        fnn.save(r"C:\Users\sachu\Downloads\employee_tracking\employee_tracking\media\pic/"+img.name,img)
        s=staff_table.objects.filter(LOGIN__id=lid)
        print(s,"===================")
        res1=enf(r"C:\Users\sachu\Downloads\employee_tracking\employee_tracking\media\pic/"+img.name)
        print(res1,"**************")
        for r in s:
            res=rec_face_image(r"C:\Users\sachu\Downloads\employee_tracking\employee_tracking\media/"+str(r.photo))
            if len(res)>0:
                name=str(r.fname)+" "+str(r.lname)
                print(name,"===================")
                # idd=r.login.id
                return JsonResponse({"result":str(r.LOGIN.id)+"#"+str(r.fname)+" "+str(r.lname)})
            else:
                return JsonResponse({"result": "na" + "#" + img.name})
    except:
        return JsonResponse({"result": "na" + "#" + img.name})

def sattend(request):
        print(request.POST,"======================================")
        sid=request.POST['lid']
        fn=request.POST['fn']
        aa=str(fn)
        ab=aa.split("/")
        ac=ab[-1]
        # ad="0"
        # for i in ab:
        #     ac=i[-1]
        #     ad=i[:1]
        print(ac,"*************************")
        print(fn,"===============================")
        from math import sin, cos, sqrt, atan2, radians
        print(request.POST, "KKKKKKKKKK")
        lat1 = float(request.POST.get('lati', 0.0))
        lon1 = float(request.POST.get('longi', 0.0))
        lat1 = float(lat1)
        lon1 = float(lon1)
        # ob1 =staff_table.objects.get(LOGIN__id=sid)
        ob=assign_work_table.objects.filter(staff__LOGIN__id=sid,date=datetime.datetime.today())
        print(ob, "LLLLLLLLLLLLLLLLL")
        r = []
        for i in ob:
            lat2 = i.work.latitude
            lon2 = i.work.longitude
            # Convert latitude and longitude to radians if they are in degrees
            lat2 = float(lat2)
            lon2 = float(lon2)
            dlon = lon2 - lon1
            dlat = lat2 - lat1
            a = sin(dlat / 2) * 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) * 2
            a = min(1.0, a)  # Ensure 'a' is not greater than 1 to avoid math domain error
            # try:
            #     c = 2 * atan2(sqrt(a), sqrt(1 - a))
            # except:
            c = 1 *sqrt(abs(a))

            print(c, "UUUUUUUUUUUUUUUUUUU")
            # Approximate radius of the Earth in kilometers
            R = 6373.0
            distance = R * c
            print(distance, "==================================")
            if distance < 1000:
                ob = attendance.objects.filter(staff__LOGIN__id=sid,date=datetime.datetime.today())
                if len(ob) == 0:
                    ob = attendance()
                    ob.date = datetime.datetime.today()
                    ob.time=datetime.datetime.now()
                    ob.image=ac
                    ob.attendance = 1
                    ob.staff = staff_table.objects.get(LOGIN__id=sid)
                    ob.work=assign_work_table.objects.get(id=i.id)
                    ob.save()
                    return JsonResponse({"result": "Attendance marked successfully"})
                else:
                    return JsonResponse({"result": "Attendance already marked today"})
        return JsonResponse({"result": "sorry,you have no works or can't locate your location"})

import calendar
import calendar

def attendanceandroid(request):
    month_name = request.POST['month']
    month_number = list(calendar.month_name).index(month_name.capitalize())

    ob = attendance.objects.filter( date__month=month_number).order_by('date')
    distdate = []
    for i in ob:
        if i.date not in distdate:
            distdate.append(i.date)
    # Your existing code continues here...
    lid = request.POST['lid']
    from django.db.models.aggregates import Sum
    data = []



    ob1 = attendance.objects.filter(staff__LOGIN__id=lid, date__month=month_number)
    for i in distdate:
        ob = attendance.objects.filter(staff__LOGIN__id=lid, date=i)
        print(ob, "=================================")
        try:
            row = {"work":str(i)+" "+ ob[0].work.work.work, "pd": ob[0].attendance ,"date":str(i)}
            print(row)
            data.append(row)
        except Exception as e:
            print(e,"=============")
            row = {"work": str(i)+" No work", "pd":"0", "date": str(i)}
            data.append(row)
    d = json.dumps(data)
    print(d)
    return HttpResponse(d)
    # for i in ob1:
    #     ob = attendance.objects.filter(staff__LOGIN__id=lid, date__month=month_number, work__id=i.work.id).aggregate(
    #         sum_present=Sum("attendance"))
    #     print(ob, "=================================")
    #     row = {"work": i.work.work.work, "pd": ob['sum_present']}
    #     data.append(row)
    # d = json.dumps(data)
    # print(d)
    # return HttpResponse(d)


#     # for i in distdate:
#     #     oba=attendance.objects.filter(date=i)
#     #     distuser=[]
#     #     for j in oba:
#     #         distuser.append(j.staff.id)
#     #     obab=staff_table.objects.exclude(id__in=distuser)
#     #     for j in obab:
#     #         print(j)
#     #         # oba=attendance()
#     #         # oba.staff=j
#     #         # oba.date=i
#     #         # oba.attendance=0
#     #         # oba.image=0
#     #         # oba.time=2
#     #         # oba.work=assign_work_table.objects.get(id=1)
#     #         # oba.save()
#     ob=staff_table.objects.all()
#
#     for i in ob:
#         oba=attendance.objects.filter(date__year=y,date__month=m,staff_id=i.id,attendance=1)
#         ta_amount=0
#         da_amount=0
#         for j in oba:
#             obta=ta.objects.filter(assignwork__id=j.work.id)
#             for k in obta:
#                 ta_amount+=k.amount
#             obda=da_table.objects.filter(assign__id=j.work.id,status='accepted')
#             for k in obda:
#                 da_amount+=k.amount
#
#         p=len(oba)/len(distdate)
#         ms=int(43200)*p
#         ms=ms+ta_amount+da_amount
#         p=round(p*100,1)
#         i.twd=len(distdate)
#         i.tpd=len(oba)
#         i.per=p
#         i.ms=int(ms)
#     return render(request,'hr/salary.html',{"val":ob,"m":m,"y":y})



def android_salary(request):
    # ob = attendance_table.objects.filter(staff__hr=hr_table.objects.get(login=request.session["lid"]))
    # , {'val': ob}
    print(request.POST)
    y = request.POST['y']
    m = request.POST['m']
    if m == "January":
        m=1
    elif m == "February":
        m = 2
    elif m == "March":
        m = 3
    elif m == "April":
        m = 4
    elif m == "May":
        m=5
    elif m == "June":
        m = 6
    elif m == "July":
        m = 7
    elif m == "August":
        m = 8
    elif m == "September":
        m = 9
    elif m == "October":
        m = 10
    elif m == "November":
        m = 11
    elif m == "December":
        m = 12

    lid=request.POST["lid"]
    ob = attendance.objects.filter(date__year=y, date__month=m).order_by('date')
    distdate = []
    for i in ob:
        if i.date not in distdate:
            distdate.append(i.date)
    for i in distdate:
        oba = attendance.objects.filter(date=i)
        distuser = []
        for j in oba:
            distuser.append(j.staff.id)
        obab = staff_table.objects.exclude(id__in=distuser)
        for j in obab:
            print(j)
            # oba=attendance()
            # oba.staff=j
            # oba.date=i
            # oba.attendance=0
            # oba.image=0
            # oba.time=2
            # oba.work=assign_work_table.objects.get(id=1)
            # oba.save()
    # ob = staff_table.objects.all()
    # for i in ob:
    oba = attendance.objects.filter(date__year=y, date__month=m, staff__LOGIN=lid)
    taa = 0
    for j in oba:
        taa = taa + int(j.attendance)
    tad = len(distdate) - taa
    ap = 0
    if len(oba) > 0:
        ap = taa / len(distdate)
    ms = int(43200) * ap
    twd = len(distdate)
    tpd = taa
    per = ap * 100
    ms = int(ms)
    ta_amount = 0
    da_amount = 0

    oba=attendance.objects.filter(date__year=y,date__month=m,staff_id__LOGIN__id=lid,attendance=1)

    for j in oba:
        obta=ta.objects.filter(assignwork__id=j.work.id)
        for k in obta:
            ta_amount+=k.amount
        obda=da_table.objects.filter(assign__id=j.work.id,status='accepted')
        for k in obda:
            da_amount+=k.amount

    ms+=ta_amount+da_amount
    data={"task":"valid","ms": str(ms).split('.')[0],"twd":twd,"tpd":tpd,"per":per}
    print(data)
    r=json.dumps(data)
    return  HttpResponse(r)

