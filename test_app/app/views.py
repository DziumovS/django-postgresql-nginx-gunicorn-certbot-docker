from django.shortcuts import render

# Create your views here.


from django.views.generic import View
from django.shortcuts import render


class HomeView(View):
    template_name = "app/home.html"

    def get(self, request, *args, **kwargs):

        context = {
            "data": "This is a test-template (:"
        }

        return render(request, self.template_name, context=context)
