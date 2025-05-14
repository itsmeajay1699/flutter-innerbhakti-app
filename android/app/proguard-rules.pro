-keep class com.google.android.exoplayer2.** { *; }
-keep class com.google.android.exoplayer2.source.** { *; }
-keepattributes *Annotation*
-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}
-optimizations !method/inlining/
-keepclasseswithmembers class * {
  public void onPayment*(...);
}