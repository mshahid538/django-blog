# Welcome to Front – Multipurpose Responsive Template! #

Front Template by Htmlstream

### Documentation and Getting Started ###

The overall development documentation is available at `documentation/getting-started.html` and Gulp documentation at `documentation/gulp.html`.

Below is quick steps to run Gulp:

- npm install --global gulp-cli
- npm install
- gulp

Yup, that's it.

### License ###

Front is licensed under Bootstrap Themes and you can find more detailed information about it here: https://themes.getbootstrap.com/licenses

### Theme Support ###

Have a question? No worries! Front comes with 6 months of free support. We take seriously every issue that is reported to us, and we aim to resolve each one as quickly as possible. Feel free to "Contact Us" at https://htmlstream.com/contact-us

### Need Front Template customization? ###

We offer affordable, professional and trendy customized design solutions, solely for your own projects! Front Template can be easily customized with its cutting-edge components and features. However, if you feel you need any further customization please drop us a message at https://htmlstream.com/hire-us and our dedicated team will assist you with your inquiries.

# mgoldmantherapy.com

This project is a Django-based website for mgoldmantherapy.com. It includes a static site converted to a dynamic site with a blog and a contact form that submits to the admin panel.

## Project Structure

- `core/` - The main Django app containing models, views, and templates.
- `static/` - Static files (CSS, JS, images) from the original static site.
- `templates/` - Django templates for the site.
- `manage.py` - Django management script.
- `mgoldmantherapy/` - Django project settings.

## Setup Instructions

### Prerequisites

- Python 3.8 or higher
- PostgreSQL
- Nginx
- Gunicorn

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd mgoldmantherapy.com
   ```

2. Create a virtual environment and activate it:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Configure PostgreSQL:
   - Create a database named `mgoldmantherapy`.
   - Update `settings.py` with your PostgreSQL credentials.

5. Run migrations:
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   python manage.py createsuperuser
   ```

6. Collect static files:
   ```bash
   python manage.py collectstatic
   ```

### Running the Development Server

```bash
python manage.py runserver
```

### Deployment

1. SSH into the server as root:
   ```bash
   ssh root@167.172.238.3
   ```

2. Set up the project in `/home`:
   ```bash
   cd /home
   git clone <repository-url> mgoldmantherapy.com
   cd mgoldmantherapy.com
   ```

3. Configure Gunicorn:
   - Create a systemd service file for Gunicorn.
   - Start and enable the service.

4. Configure Nginx:
   - Create a Nginx configuration file for the project.
   - Restart Nginx.

5. Collect static files and migrate the database:
   ```bash
   python manage.py collectstatic
   python manage.py migrate
   ```

6. Restart Gunicorn and Nginx:
   ```bash
   systemctl restart gunicorn
   systemctl restart nginx
   ```

## Features

- **Blog Page**: A simple blog to display posts.
- **Contact Form**: Submits to the Django admin panel.

## Notes

- Ensure not to interfere with other live projects on the server.
- The domain has been updated to point to the new server.

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}