# Generated by Django 3.2.22 on 2024-03-15 08:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('emp_app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='leave_table',
            name='reason',
            field=models.TextField(default=1),
            preserve_default=False,
        ),
    ]
