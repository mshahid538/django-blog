from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.views.generic import ListView, DetailView
from .models import Blog, Contact

def home(request):
    return render(request, 'home.html')

def blog(request):
    posts = Blog.objects.all().order_by('-created_at')
    return render(request, 'core/blog.html', {'posts': posts})

def contact(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        subject = request.POST.get('subject')
        message = request.POST.get('message')
        
        Contact.objects.create(
            name=name,
            email=email,
            subject=subject,
            message=message
        )
        
        return render(request, 'contact_success.html')
    
    return render(request, 'contact.html')

class BlogListView(ListView):
    model = Blog
    template_name = 'blog.html'
    context_object_name = 'posts'
    queryset = Blog.objects.filter(is_published=True).order_by('-created_at')

class BlogDetailView(DetailView):
    model = Blog
    template_name = 'blog_detail.html'
    context_object_name = 'post'
    slug_url_kwarg = 'slug' 