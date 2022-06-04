import 'package:flutter/material.dart';
import 'package:pet_world/models/petType.dart';
import 'package:pet_world/shared/const.dart';

class birdsScreen extends StatelessWidget {
  final List<petType> breeds=[
    petType(Text: 'Bourkes parrots are very friendly, peaceful, gentle and calm birds. They’re not particularly playful but not as hectic and active as other birds. They’re very popular among beginners as they hardly make any sound at all, are able to amuse themselves and don’t have any unusual special needs. They’re similar to budgies and cockatiels to keep. They’re also called Bourkies. The Bourkes parrots special quirk is a love of bathing. Watching them passionately splashing about is a real pleasure! It goes without saying that the water should always be fresh, cool and clean. You can also spray your birds with a refreshing mist of water as a fun game. Simply fill up a spray bottle with water and make sure it’s set to produce a fine mist. Watch out: make sure you don’t surprise the birds and don’t spray at their eyes!',
        bread: 'Bourkes Parrot',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/bourkes_parrot_pink_l.jpg'),
    petType(Text: 'Budgerigars, or budgies, are very popular because they’re playful, cheerful, peaceful and undemanding. Watching them curiously explore their surroundings can be tremendous fun. They’re good at amusing themselves but are happy to be near their humans. They often become very trusting and hand-tame. That’s why they’re particularly popular among beginners.',
        bread: 'Budgie',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/budgies_l.jpg'),
    petType(Text: 'Canaries are known and loved for their lovely singing. Their yellow plumage is their trademark. But they can actually come in many different colors (see below)! It’s possible that two very famous characters have caused most people to think of canaries as yellow: cartoon bird Tweety Pie (that tomcat Silvester hunts) and Woodstock, Snoopy’s bird in Peanuts. Canary birds are suitable for beginners as they do not have any unusual special needs. But it is important to know that they do not like being touched and can not be hand-tamed. You often read that canaries can be kept alone as they do not flock together in nature. It is true that they only pair up during breeding times, but they’re by no means loners as they create loose groups in the wild. So, they can not be kept alone as pets.',
        bread: 'Canary',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/canary_bird_l.jpg'),
    petType(Text: 'Cockatiels are funny souls: they’re friendly, intelligent, cheerful, lively, active, curious and love to play. These birds are incredibly popular among experienced bird keepers as well as beginners as they’re so easy-going, loving and affectionate. Cockatiels like to be near people. They like to sit on your shoulder or hand, cuddle up to you, play with your hair, give you little nose kisses and gently nibble your ear. If they trust you, you can even pet the back of their heads. But watch out: cockatiels don’t like to be cuddled and petted like cats and dogs. After all, these animals are delicate. Cockatiels are very clear about what they want, whether they want to be left alone or would like some company.',
        bread: 'Cockatiel',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/cockatiels_l.jpg'),
    petType(Text: 'Goldies lorikeets are calm, gentle, peaceful and reserved parrots. Especially with new people or things, they keep their distance before they carefully get closer step by cautious step. They’re intelligent, entertaining and always up for some fun. Some like to wrap themselves up in a blanket to sleep, which is adorable. Goldie’s lorikeets are not known for breaking things or being particularly loud. But they’re not particularly suited to beginners as they need special food. Find out more below. Goldies lorikeets are also jokingly called “little watermelons” because their yellow-green plumage has little black tips, making them look like watermelons. They have bright red crests on their heads and the plumage around the eyes is blue, while their cheeks are pink to purple. Beautiful!',
        bread: 'Goldies Lorikeet',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/goldies_lorikeet_l.jpg'),
    petType(Text: 'Lovebirds are very funny, playful, clumsy and silly little “clowns”. Their cheeky but very lovable and adorable personalities are hard to resist. Be careful! Anyone that watches these birds curiously explore their surroundings, play and cuddle up together runs the risk of falling head over heels in love with them! Lovebirds are sometimes called “pocket parrots” (like the Pacific parrotlet) as these little birds often have the mischievous and impish personalities of big parrots in a tiny package.',
        bread: 'Lovebird',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/fischers_lovebird_l.jpg'),
    petType(Text: 'Monk parakeets are lively, confident and sociable birds. They’re well-known for their cheeky personalities and their silly, slightly clumsy “adventures” that see them stumbling around without a care and not achieving a great deal. Monk parakeets are louder and more active than other birds and need a lot of attention (time), so any beginners should really think about whether they’re ready for this challenge. As a reward, your heart will swell when these adorable little chirpers let you pet them on their backs and heads. These moments are priceless!',
        bread: 'Monk Parakeet',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/monk_parakeet_birds_l.jpg'),
    petType(Text: 'Pacific parrotlets are very cheerful, funny, intelligent, feisty, curious and cheeky little chaps. They’re becoming more and more popular as pets as their plumage is so colorful and you can even teach them tricks with enough patience. Pacific parrotlets are also jokingly called “pocket parrots” because they’re so small. But they don’t know how little they are. They have the character, personality and confidence of big parrots. You could say they’re big birds in small bodies. Pacific parrotlets aren’t just little rascals, they’re also unflappable explorers. With a decent dose of courage and a spirit that is never daunted by anything, they love to fly around exploring their surroundings. But they can get themselves into some scrapes, especially if you also have cats or dogs in the house. As a human, you also have to be careful and make sure you don’t accidentally sit or step on your pets. Pacific parrotlets get bored easily. They need lots to do, like flying and new toys. If you neglect these birds, they will get aggressive and start destroying things. Want to know something cute? Pacific parrotlets like to sleep in hammocks!',
        bread: 'Pacific Parrotlet',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/pacific_parrotlet_l.jpg'),
    petType(Text: 'White-crowned parrots are even-tempered, docile, friendly, kind-hearted but also funny and lively birds. They’ll happily sit on your shoulder or arm, playing and dancing. They’ll often hide and wait for the right moment to play a funny prank on their humans. Such as stealing your pen or piece of paper. They’re incorrigible! White-crowned parrots like to learn tricks, and they learn fast as they’re very intelligent. They also like being petted. White-crowned parrots might look like big parrots in photos, but they’re actually much smaller. Their special features are the white crown on their heads, their white necks and the bright blue and green plumage under their brown wings. Quiet and long naps (even during the day) are very important to white-crowned parrots. Some animals even sleep for around twelve hours a day. These birds are therefore ideal for anyone worried about pet birds being too loud. Still, you should consider: White-crowned parrots live for a good 20 years, and some even make it to 30 or 40 years old. That’s why you should really consider whether you can and want to care for an animal for such a long time. Life constantly changes, you get new hobbies, you might study abroad or get a job that takes up all your time.',
        bread: 'White-Crowned Parrot',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/white-crowned_parrot_l.jpg'),
    petType(Text: 'Zebra finches are peaceful, lively, cheerful and social birds. Their melodies are so magical and varied that you spend all day with them, listening to their wonderful songs. When they’re not singing, they make cute little tweeting sounds. But zebra finches aren’t just popular for their singing. They’re also one of those bird species that are easy to keep. Their needs are easy to fulfil. That’s why they’re particularly popular among beginners. Please note: If you’re looking for a bird you can pet, the zebra finch is not for you. With a lot of patience, time and luck, a zebra finch might hop onto your finger, but you could never call them hand-tame. They don’t like being touched. But it’s a lot of fun to watch these quirky pets flying and hopping around.',
        bread: 'Zebra Finch',
        image: 'https://www.animalfunfacts.net/images/stories/pets/birds/zebra_finches_l.jpg'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Birds Breed',style: TextStyle(color:Colors.black),),
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

            ],
          ),
        )



    );
  }
}