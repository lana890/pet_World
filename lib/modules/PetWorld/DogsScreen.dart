import 'package:flutter/material.dart';
import 'package:pet_world/models/petType.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/single_child_widget.dart';

class DogsScreen extends StatelessWidget {
  final List<petType> breeds=[
    petType(Text: 'The American Bulldog is stocky and muscular, but also agile and built for chasing down stray cattle and helping with farm work. In fact, some are known to jump six feet or more into the air. American Bulldogs are intelligent and affectionate, which makes them great, protective family dogs; although, they have high exercise needs and require an experienced, active pet parent. They can vary in appearance, as there are multiple types, including the Bully or Classic type, also known as the Johnson type, the Standard or Performance type, also called the Scott type, and hybrids of the two.',
        bread: 'American Bulldog',
        image: 'https://dogtime.com/assets/uploads/2017/12/american-bulldog-breed-pictures-9-460x260.jpg'),
    petType(Text: 'The American Leopard Hound is a purebred dog whose ancestors came from Mexico by way of Spanish conquistadors who sailed to North America. They are energetic, sociable, and intelligent pooches who possess all-around great traits. The American Leopard Hound goes by other names, such as the Leopard Cur, American Leopard, and American Leopard Cur. You can look for this pure breed by checking your local shelters or rescues. Remember it’s best to adopt and not shop!',
        bread: 'American Leopard Hound',
        image: 'https://dogtime.com/assets/uploads/2019/09/american-leopard-hound-dog-breed-picture-cover.jpg'),
    petType(Text: 'Despite their name, the Australian Shepherd dog breed originated in the western United States, not Australia, around the time of the Gold Rush in the 1840s. Originally bred to herd livestock, they remain a working dog at heart. You can find these dogs in shelters and rescues, so opt to adopt if you can!',
        bread: 'Australian Shepherd',
        image: 'https://dogtime.com/assets/uploads/2011/01/file_23168_australian-shepherd-460x290.jpg'),
    petType(Text: 'The Barbado da Terceira dog breed was developed on the Portuguese island of Terceira to work herding cattle and guarding livestock. Today this medium-sized breed is known for being loyal and smart. Although these are purebred dogs, you may still find them in shelters and rescues. ',
        bread: 'Barbado da Terceira',
        image: 'https://dogtime.com/assets/uploads/2021/05/Barbado-da-Terceira-dog-breed-pictures-cover.jpg'),
    petType(Text: 'The Basset Fauve de Bretagne is a purebred dog from France. These pups are intelligent, friendly, and active, which are great qualities for a hound dog. The Basset Fauve de Bretagne also goes by the name Fawn Brittany Basset. If you so happen to want to bring one of these adorable pooches into your home and family, then make sure to check breed specific rescues or your local shelter.',
        bread: 'Basset Fauve de Bretagne',
        image: 'https://dogtime.com/assets/uploads/2019/09/Basset-Fauve-de-Bretagne-dog-breed-pictures-cover.jpg'),
    petType(Text: 'Small, compact, and hardy, Beagles are active companions for kids and adults alike. Canines of this dog breed are merry and fun loving, but being hounds, they can also be stubborn and require patient, creative training techniques. Their noses guide them through life, and they’re never happier than when following an interesting scent. Beagles originally were bred as scenthounds to track small game, mostly rabbits and hare. They’re still used for this purpose in many countries today, including the United States. But you willl find plenty of these pups living as companion dogs and loving, furry family members.',
        bread: 'Beagle',
        image: 'https://dogtime.com/assets/uploads/2011/01/file_23012_beagle-460x290.jpg'),
    petType(Text: 'Canines of the Belgian Malinois dog breed were originally bred to be herding dogs. Today, they also work as police and military dogs, protection dogs, and loving family members. Even though these are purebred dogs, you may find them at breed specific rescues and shelters. You can also try DogTime’s adoption page that lets you search for adoptable dogs by breed and zip code. Opt to adopt!',
        bread: 'Belgian Malinois',
        image: 'https://dogtime.com/assets/uploads/2011/01/file_23172_belgian-malinois-460x290.jpg'),
    petType(Text: 'Created in Belgium in the late 19th century, the Belgian Tervuren dog breed is often considered to be the most elegant of the four Belgian sheepdogs. They’re intelligent and athletic, making them a versatile performer in any number of activities, including their original job, herding. Even though these are purebred dogs, you may find them in the care of shelters or rescue groups.',
        bread: 'Belgian Tervuren',
        image: 'https://dogtime.com/assets/uploads/2011/01/file_23176_belgian-tervuren-460x290.jpg'),
    petType(Text: 'Indigenous to the United States, the Carolina Dog is a rare, primitive dog breed and relatively new to domesticity. They are medium in size, agile, and independent; they’re also known for being very clean dogs. The Carolina Dog is also sometimes called the Yellow Dog, the American Dingo, the Dixie Dingo, and the Yaller. They were feral and lived in the Southeastern United States for hundreds of years, and they’re still found in the wild in some parts of Georgia and South Carolina.',
        bread: 'Carolina Dog',
        image: 'https://dogtime.com/assets/uploads/2020/04/carolina-dog-breed-pictures-cover.jpg'),
    petType(Text: 'The Cavapoo is a mixed breed dog — a cross between the Cavalier King Charles Spaniel and Poodle dog breeds. Outgoing, playful, and curious, these pups inherit some of the best traits from both of their parents. Cavapoos go by several names, including Cavadoodle and Cavoodle. Despite their unfortunate status as a designer breed, you can find these mixed breed dogs in shelters and rescues',
        bread: 'Cavapoo',
        image: 'https://dogtime.com/assets/uploads/2019/08/cavapoo-mixed-dog-breed-pictures-cover.jpg'),
    petType(Text: 'Created in the White Mountains of New Hampshire, the Chinook dog breed made its name on Admiral Byrd’s first Antarctic expedition in 1928. These days they’re multipurpose dogs who are happy hiking, competing in agility and other dog sports, pulling a sled or other conveyance, and playing with the kids. Even though these are purebred dogs, you may find them in the care of shelters or rescue groups. ',
        bread: 'Chinook',
        image: 'https://dogtime.com/assets/uploads/2011/01/file_23232_chinook-460x290.jpg'),
    petType(Text: 'The German Shepherd Dog is one of America’s most popular dog breeds — for good reasons. They’re intelligent and capable working dogs. Their devotion and courage are unmatched. And they’re amazingly versatile. The breed also goes by the name Alsatian. Despite their purebred status, you may find German Shepherds in shelters and breed specific rescues',
        bread: 'German Shepherd Dog',
        image: 'https://dogtime.com/assets/uploads/2011/01/file_23188_german-shepherd-dog-460x290.jpg'),
    petType(Text: 'The Golden Cocker Retriever is a mixed breed dog–a cross between the Golden Retriever and Cocker Spaniel dog breeds. Sweet, playful, and intelligent, these pups inherited some of the best qualities from both of their parents. Golden Cocker Retrievers also go by the names Cogol and Dakota Sport Retriever. You can find these mixed breed dogs in shelters and breed-specific rescues, so remember to always adopt! Don’t shop if you’re looking to add a one of these sweet pups to your home!',
        bread: 'Golden Cocker Retriever',
        image: 'https://dogtime.com/assets/uploads/2019/10/golden-cocker-retriever-mixed-dog-breed-pictures-cover-1.jpg'),
    petType(Text: 'The Havapoo is a hybrid dog breed — a cross between the Havanese and Poodle (usually, a Miniature or Toy Poodle). Affectionate, intelligent, and gentle, these small dogs are versatile for many types of families.Havapoos are also known as Poovanese, Havadoodles, and Havanoodles. They are considered “designer dogs,” bred on purpose to emphasize desirable characteristics from each breed.',
        bread: 'Havapoo',
        image: 'https://dogtime.com/assets/uploads/2020/11/havapoo-hybrid-dog-breed-pictures-cover.jpg'),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dogs Breed',style: TextStyle(color:Colors.black),),
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