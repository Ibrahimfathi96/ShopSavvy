import 'package:ecommerce_application/core/constants/image_assets.dart';
import 'package:ecommerce_application/data/model/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "Choose Product",
    body: "We Have a +100k Products. Choose \n your Product From Our E-Commerce Shop.",
    image: ImageFromAssets.onBoardingImageOne
  ),
  OnBoardingModel(
    title: "Easy & Safe Payment",
    body: "Easy Checkout & Safe Payment \n method Trusted by our Customers \n From all over the world.",
    image: ImageFromAssets.onBoardingImageTwo
  ),
  OnBoardingModel(
    title: "Track Your Order",
    body: "Best Tracker has been Used For \n Tracking Your Order. You'll know where \n your product is at the moment. ",
    image: ImageFromAssets.onBoardingImageThree
  ),
  OnBoardingModel(
    title: "Fast Delivery",
    body: "Reliable and Fast Delivery. We \n Deliver your product the fastest \n way possible.",
    image: ImageFromAssets.onBoardingImageFour
  ),
];
