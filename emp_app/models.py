from django.db import models
# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=50)
    password=models.CharField(max_length=50)
    type=models.CharField(max_length=50)
class hr_table(models.Model):
    LOGIN = models.ForeignKey(login_table,on_delete=models.CASCADE)
    fname = models.CharField(max_length=50)
    lname = models.CharField(max_length=50)
    dob = models.DateField()
    gender = models.CharField(max_length=50)
    place = models.CharField(max_length=50)
    post = models.CharField(max_length=50)
    pin = models.IntegerField()
    phno = models.BigIntegerField()
    email = models.CharField(max_length=50)
    photo = models.FileField()
class staff_table(models.Model):
    LOGIN = models.ForeignKey(login_table,on_delete=models.CASCADE)
    fname = models.CharField(max_length=50)
    lname = models.CharField(max_length=50)
    dob = models.DateField()
    gender = models.CharField(max_length=50)
    place = models.CharField(max_length=50)
    post = models.CharField(max_length=50)
    pin = models.IntegerField()
    phno = models.BigIntegerField()
    email = models.CharField(max_length=50)
    photo = models.FileField()

class work_table(models.Model):
    hr = models.ForeignKey(hr_table,on_delete=models.CASCADE)
    work=models.CharField(max_length=50)
    description=models.CharField(max_length=500)
    status=models.CharField(max_length=50)
    date=models.DateField()
    latitude=models.FloatField()
    longitude=models.FloatField()
    plan=models.FileField()
    client=models.CharField(max_length=50)




class assign_work_table(models.Model):
    staff=models.ForeignKey(staff_table,on_delete=models.CASCADE)
    work=models.ForeignKey(work_table,on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    date = models.DateField()


class complaint(models.Model):
    staff = models.ForeignKey(staff_table,on_delete=models.CASCADE)
    complaint = models.CharField(max_length=500)
    reply = models.CharField(max_length=500)
    date = models.DateField()




class attendance(models.Model):
    staff = models.ForeignKey(staff_table,on_delete=models.CASCADE)
    work = models.ForeignKey(assign_work_table,on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()
    image=models.FileField()
    attendance=models.IntegerField()



class ta(models.Model):
    assignwork = models.ForeignKey(assign_work_table,on_delete=models.CASCADE)
    login_latitude = models.FloatField()
    login_longitude = models.FloatField()
    distance = models.FloatField()
    amount = models.FloatField()
    status = models.CharField(max_length=100)
    date = models.DateField()


class ta_location(models.Model):
    staff = models.ForeignKey(staff_table, on_delete=models.CASCADE)
    from_latitude = models.FloatField(null=True)
    from_longitude = models.FloatField(null=True)
    to_latitude = models.FloatField(null=True)
    to_longitude = models.FloatField(null=True)
    time = models.TimeField()
    date = models.DateField()


class da_table(models.Model):
    assign = models.ForeignKey(assign_work_table,on_delete=models.CASCADE)
    expense = models.CharField(max_length=100)
    amount = models.FloatField()
    bill = models.FileField()
    status = models.CharField(max_length=100)
    date = models.DateField()


class leave_table(models.Model):
    staff = models.ForeignKey(staff_table,on_delete=models.CASCADE)
    date = models.DateField()
    reason =models.TextField()
    no_of_days = models.IntegerField()
    from_date= models.DateField()
    status = models.CharField(max_length=500)





class location_table(models.Model):
    LOGIN = models.ForeignKey(login_table,on_delete=models.CASCADE)
    latitude = models.FloatField()
    longitude = models.FloatField()


class salary_table(models.Model):
    staff = models.ForeignKey(staff_table,on_delete=models.CASCADE)
    salary = models.FloatField()
    month = models.IntegerField()
    year = models.IntegerField()


