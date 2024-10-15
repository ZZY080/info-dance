---
typora-root-url: ./images
---

#### 1.安装java

- 1.下载地址

  https://www.oracle.com/java/technologies/downloads/?er=221886#java8

  ![](/02.png)

- 2.环境变量

  ![](/04.png)

![](/03.png)

#### 2.安装AndroidStudio

- 1.下载地址

  https://developer.android.com/studio/archive?hl=zh-cn

  <img src=".\01.png" style="width:1200px;" />

#### 3.播放网络视频

- 1.需要在manifests/AndroidManifest.xml中配置网络权限以及在res/xml/下新建network_security_config.xml

  ![](/05.png)

  ![](/06.png)

  ![](/07.png)

  ![](/08.png)

#### 4.gradle镜像

```
1.配置gradle/wrapper/gradle-wrapper.properties
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.4-bin.zip
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists


2.settings.gradle
pluginManagement {
    repositories {
        // 使用阿里镜像源
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/central' }
        maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        // 使用阿里镜像源
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/central' }
        google()
        mavenCentral()
    }
}

rootProject.name = "Demo"
include ':app'


```

