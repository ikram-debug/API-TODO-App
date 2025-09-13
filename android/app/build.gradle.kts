plugins {
    id("com.android.application")
    id("kotlin-android")

    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")

    // 👇 Add Google Services plugin
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.todo_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.ikroodev.todo_app"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}



dependencies {
    // 👇 Import Firebase BoM (Bill of Materials)
    implementation(platform("com.google.firebase:firebase-bom:34.1.0"))

    // 👇 Firebase products you need (choose as per your project)
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
    implementation("com.google.firebase:firebase-database") // for Realtime Database
    // implementation("com.google.firebase:firebase-firestore") // uncomment if you use Firestore
}
