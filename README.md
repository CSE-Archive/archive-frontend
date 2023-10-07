# CSE Archive Frontend

This is the source code of our app frontend implemented with the Flutter framework, which is open source for educational purposes and contributions.

## Deployment

The steps described below are suitable for deploying this project in a development environment. If you intend to deploy this to production, you can read 
[this article](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04) on nginx setup. It's worth mentioning that you can get the `index.html` file required for nginx, by running the following command in the project's root.

```bash
flutter build web --web-renderer canvaskit --release --no-tree-shake-icons
```

After running it, you will find generated files in `build/web/` directory.

### Requirements

It is assumed that [Flutter SDK](https://docs.flutter.dev/get-started/install) and one of [Google Chrome](https://www.google.com/chrome) or [Microscope Edge](https://www.microsoft.com/en-us/edge/download) browsers are installed on your OS.

### Environment Configuration

Copy the `.env.example` file content and paste it to a new file named `.env` at the project's root. Now fill in the variables values according to the description below.

- **API_BASE_URL**: This variable is required and points to the base URL of our REST API backend that you can set up by following [these steps](https://github.com/CSE-Archive/archive-api#set-up--deploy).
- **SENTRY_DSN**: This variable can be ignored in development and is only required in the production environment. DSN is used to report production errors to Sentry, you can get it by creating a free account on their website. Read more about Sentry for Flutter [here](https://docs.sentry.io/platforms/flutter). 

### Install Dependencies

At the project's root, use the following command to install project dependencies listed in [pubspec.yaml](./pubspec.yaml) under `dependencies` section.

```bash
flutter pub get
```

### Running the App

Now that everything is ready, you can execute the following command to run an instance of the app for the web.

With **Google Chrome** browser as device:

```bash
flutter run -d chrome --web-renderer html
```

With **Microsoft Edge** browser as device:

```bash
flutter run -d edge --web-renderer html
```

## Contribution

Contributions of any size are welcomed here. You only need to:

1. Fork the project.
2. Make your changes in a new branch.
3. Create a Pull Request with a title that summarizes your changes and a description that explains your changes in more detail.

If you have any enhancement ideas but don't feel like doing it yourself, you can always [open a new issue](https://github.com/cse-archive/archive-frontend/issues/new?labels=enhancement) for that.
