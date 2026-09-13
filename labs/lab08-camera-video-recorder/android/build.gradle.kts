allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// --- จุดที่เราเพิ่มคำสั่งบังคับแพ็กเกจดื้อๆ ให้อัปเดตเวอร์ชัน ---
subprojects {
    afterEvaluate {
        if (project.hasProperty("android")) {
            val androidExt = project.extensions.findByName("android")
            if (androidExt is com.android.build.gradle.LibraryExtension) {
                if (androidExt.namespace == null) {
                    androidExt.namespace = project.group.toString()
                }
                // สั่งบังคับให้ทุกแพ็กเกจอัปเกรดเป็นเวอร์ชัน 36 ทันที
                androidExt.compileSdk = 36 
            }
        }
    }
}
// --------------------------------------------------------

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}