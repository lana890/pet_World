import 'package:flutter/material.dart';
import 'package:pet_world/models/petType.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/single_child_widget.dart';

class FishScreen extends StatelessWidget {
  final List<petType> breeds=[
    petType(Text: 'Guppies are known as great breeders. They will not need too much encouragement from your part, but you might want to limit the breeding process when it comes to guppies and make it in a controlled environment. it is better to provide and buy a breeding aquarium where you will be able to breed guppies. They will breed even without your input at a crazy rate at times; they start breeding when they mature. You can determine maturity in males and females by looking at their colors – males are much brighter and vivid in color. Another way to determine that is that the males have an anal fin and are also smaller than females.',
        bread: 'Guppy Fish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/guppy-fish.jpg'),
    petType(Text: 'Endler’s livebearers are a special type of guppies – which means that they are great breeders, too. They will breed very easily in the right conditions. For endler’s, too, you might need to get a separate tank for breeding. It is essential that you put only endler’s guppies into it because they can mix with other types of guppies. They are a relatively rare species, and for this reason, it is better to put the only endler’s in the tank. It is a good idea to have more females than males in your tank – a good ratio would be 3 females to one male. In this way, the females will not be overly stressed by mating efforts and attention.',
        bread: 'Endler’s',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/endler-guppy-5-gallon.jpg'),
    petType(Text: 'Like guppies and endler’s, the molly fish are livebearers. This means that they will carry the eggs inside their bodies. And like guppies, they are great breeders and doing so will not prove to be a particularly hard job. When you want to breed mollies, you need to keep in mind that the conditions for breeding should be perfect. Only then will the mollies breed. It takes up to 30-45 days after fertilization for the fry to be released. This is the point where you should step in; you should put the young one in a separate tank, or else they will get eaten.',
        bread: 'Molly Fish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/molly-fish.jpg'),
    petType(Text: 'The next on the list is the platy fish. These are also known as very prolific breeders. In this respect they are not too different from the guppies and mollies. They are prepared to breed even without your specific encouragement. They are also livebearers, just like the guppies and mollies. What you should do is put some males and females together in the same tank and provide perfect conditions for breeding – this means the right water temperature and cleanness should be maintained. They will start breeding when they are mature – at about the age of 4 months. When mature, female platy fish are larger than the males. For breeding, make sure to put the fry and grow it in a separate tank. This will prevent the newborn fish from getting eaten.',
        bread: 'Platy Fish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/platy-fish.jpg'),
    petType(Text: 'The swordtail fish are very beautiful fish to keep in your tank. They are not demanding and don’t require too much of your time, but they are also very active breeders. Swordtail fish are livebearers. Just like the previous fish on this list, the swordtail fish will breed actively without any major intervention from the owner. They are also similar to other fish on this list in a sense that they tend to eat the fry they make, so make sure that you either put the fry in a separate breeding tank and grow them there, or make sure that there is a lot of vegetation in your tank where the fry will be able to hide. The first action is probably also much more efficient and will allow you to grow much more fish.',
        bread: 'Swordtail Fish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/swordtail-fish.jpg'),
    petType(Text: 'Least killifish are great fish to breed. Also known as Heterandria Formosa, the least killifish will reproduce in the right conditions in the tank. They start reproducing as they mature, and you will know when the females start to drop eggs that they have reproduced. In general, the least killifish do not represent a specific threat to the newborn fish, but it might occur.  For this reason, putting them in a separate container might be a better course of action, but the newborn fish are relatively big, so you will not need to worry too much about that.',
        bread: 'Least Killifish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/11/least-killifish-heterandria-formosa.jpg'),
    petType(Text: 'Angelfish are known as one of the most unique, beautiful and graceful fish for freshwater tanks. They are revered as graceful in the way they swim and behave, and for their stunning appearance that will liven up any aquarium. So there is plenty of reasons to grow your own angelfish. The thing about breeding them is that it is very easy to do so; you might end up being a breeder without even knowing it! One difficulty, however, is determining which angelfish are male and which are female. In general, the males tend to have a hump on their noses, but they also tend to be more territorial.',
        bread: 'Angelfish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/angelfish.jpg'),
    petType(Text: 'Ram cichlids are stunning fish that often catch the eye of the spectators with their shining colors. The conditions for breeding should be absolutely right in order to enable breeding. The best breed in soft, acidic water with the right temperatures.  For breeding, you can use a separate tank and put females and males into it. In this way, you should allow the right conditions in the tank and also plenty of vegetation. You might want to be careful about the fish eating the fry; for this reason, you can put the fry into a separate tank. You will have yourself some beautiful, young ram cichlids on your own in a matter of weeks.',
        bread: 'Ram Cichlids',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/ram-cichlids.jpg'),
    petType(Text: 'Kribensis cichlids, or the P. pulcher are very good breeders. The breeding process is very simple; firstly, you need to make sure that you have males and females in the same tank – it is better if they are young and strong. For breeding, it is better to give the breeding couple their own tank, which will allow them space and also allow the fry to grow. Set up a 10-gallon tank for breeding with plenty of vegetation and also enough room to allow the fry to grow.',
        bread: 'Kribensis Cichlids',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/kribensis-cichlids.jpg'),
    petType(Text: 'Zebra danios are considered as a great breeding species for beginners. In the wild, these fish will breed on their own. All you need to do is provide a breeding tank of about 10 gallons and with temperatures of about 71 degrees Fahrenheit in order to let the fish grow. You should keep the fish (male and females) together in a separate tank with the right conditions. You should feed them high-quality foods and in a matter of two weeks, you will see females getting rounder, which means they have eggs inside them. After the eggs are spawned, you should put the parents away to prevent them from feeding on the eggs and fry.',
        bread: ' Zebra Danios',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/zebrafish-danio.jpg'),
    petType(Text: 'Convict cichlids are beautiful little fish that make great breeders. The reason for this is that you do not need a separate container to breed them, and you will also breed them very easily, as they are very avid breeders on their own. They mature at about 7 months, and that is when you can expect to see some eggs on rocks in your tank (you want to have them in your tank). These eggs will develop and fry will come out; the females will guard the eggs, and will not eat them – which is the case with plenty of other fish. It might take up to a week for the fry to develop.',
        bread: 'Convict Cichlids',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/11/convict-cichlid.jpg'),
    petType(Text: 'Gouramis are stunning fish to look at but also great fish to keep in your tank. The breeding process with gouramis is quite different from other fish. After breeding and courting to the females, the males will build a nest in the water. Once the eggs are laid, the males will take the eggs into their nest and protect them from other fish and females until they are hatched. This may make them aggressive, which is why you should put the females into a separate tank.',
        bread: 'Gourami Fish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/gourami-fish.jpg'),
    petType(Text: 'You can see why people want to breed the betta fish on their own. They truly are stunning specimens and are also very unique. For this to happen, you need to have the right conditions in your tank, but also you need to make sure that there is only one male in the tank, with a female or two. Breeding betta fish can be quite challenging, but when you do so, it is much more rewarding. The better conditions there are, the more chance you have for breeding. You need to introduce the female to the male slowly. You can do this by putting the female into a small container.Once you get them together, mating will begin. Once the eggs are laid, it will be the male that will care for the eggs. This is when you should remove the female from the tank. For the fry to develop, make sure that you provide the right conditions.',
        bread: 'Betta Fish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/08/betta-fish.jpg'),
    petType(Text: 'Breeding killifish is relatively easy, as they are known as great breeders. One thing you need to know about killifish is that there are two types of killifish: annual killifish and non-annual killifish. The annual ones grow up quickly and only live to up to 2 years. Eggs will be laid quickly and will develop in about 3 months. The whole process is very quick.  The non-annual killifish are different; they have a longer lifespan, and they need a much barer tank. You want to remove the parents from the tank quickly after the eggs are spawned.',
        bread: 'Killifish',
        image: 'https://smartaquariumguide.com/wp-content/uploads/2019/11/killifish.jpg'),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fish Breed',style: TextStyle(color:Colors.black),),
          backgroundColor: Colors.transparent,
        ),
        body:SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child:Column(
            children: [
              Row(children: [
                buildPetBreed(breeds[0],context),
                SizedBox(width: 10,),
                buildPetBreed(breeds[1],context),
              ]),
              Row(children: [
                buildPetBreed(breeds[2],context),
                SizedBox(width: 10,),
                buildPetBreed(breeds[3],context),
              ]),
              Row(children: [
                buildPetBreed(breeds[4],context),
                SizedBox(width: 10,),
                buildPetBreed(breeds[5],context),
              ]),
              Row(children: [
                buildPetBreed(breeds[6],context),
                SizedBox(width: 10,),
                buildPetBreed(breeds[7],context),
              ]),
              Row(children: [
                buildPetBreed(breeds[8],context),
                SizedBox(width: 10,),
                buildPetBreed(breeds[9],context),
              ]),
              Row(children: [
                buildPetBreed(breeds[10],context),
                SizedBox(width: 10,),
                buildPetBreed(breeds[11],context),
              ]),
              Row(children: [
                buildPetBreed(breeds[12],context),
                SizedBox(width: 10,),
                buildPetBreed(breeds[13],context),
              ]),

            ],
          ),
        )



    );
  }
}