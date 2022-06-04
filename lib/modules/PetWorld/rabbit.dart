import 'package:flutter/material.dart';
import 'package:pet_world/models/petType.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/single_child_widget.dart';

class RabbitScreen extends StatelessWidget {
  final List<petType> breeds=[
    petType(Text: 'The American Fuzzy Lop is a rabbit breed recognized by the American Rabbit Breeders Association (ARBA). It is similar in appearance to a Holland Lop. However, the American Fuzzy Lop is a wool breed and will have wool similar to the Angora breeds although the wool will be shorter than that of a commercial Angora.',
        bread: 'American Fuzzy Lop',
        image: 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Conejillo_de_indias.jpg'),
    petType(Text: 'The American Sable is a result of Chinchilla rabbit crosses. Sables are identical to Chinchilla rabbits in body conformation, but their coats are colored differently. The head, feet, ears, back, and top of the tail are a dark sepia, while the coat fades to a lighter tan over the rest of the body, similar to the coloring of a Siamese cat. The breeds eyes are usually dark with a ruby hue. Typically their weight can reach 7-15 lbs.',
        bread: 'American Sable',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/American_Sable.png/375px-American_Sable.png'),
    petType(Text: 'The Belgian Hare is most known for its distinctively close resemblance to a hare, with a long, fine body with muscular flank, and distinctly arched back with loins and well-rounded hind quarters. Their head is long and their tail straight and carried in line with the backbone. The fore feet of a Belgian Hare are usually long and fine-boned and perfectly straight, while their hind feet are long, fine, and flat. They are believed to be the only breed of domestic rabbit featuring a deep red, rich chestnut color of the Belgian Hare, together with black ticking of a wavy or blotchy appearance',
        bread: 'Belgian Hare',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Hasenkaninchen.jpg/450px-Hasenkaninchen.jpg'),
    petType(Text: 'The Blanc de Hotot is always white, with black bands around the eyes, which by breed registry standards should not be more than 1⁄16 to 1⁄8 inch (0.16 to 0.32 cm) wide. These bands give the breed "the appearance of fine spectacles around the eye".[1] The body type is compact, thickset and somewhat rounded. Dewlaps are sometimes present in Does, but are penalized in showing for bucks. The breed has a wide chest, short neck and well muscled fore- and hind-quarters.[1] Originally the black eye bands were not part of the breed standard, which instead described black eyelashes and gray lower eyelids. The fur has a large number of guard hairs, which create a sheen reminiscent of frost. Bucks weigh 8 to 10 pounds (3.6 to 4.5 kg) and does 9 to 11 pounds (4.1 to 5.0 kg). The Blanc de Hotot is an active and hardy breed',
        bread: 'Blanc de Hotot',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Hotot_Rabbit%21.jpg/375px-Hotot_Rabbit%21.jpg'),
    petType(Text: 'The Deilenaar is a breed of rabbit from the Netherlands. It is a medium-sized rabbit, weighing between 5 and 7 pounds (2.3 and 3.2 kg) with chestnut red fur.[1] It is a rare variety (Fur Section) in the UK. It is recognised by the British Rabbit Council, but not by the American Rabbit Breeders Association.',
        bread: 'Deilenaar',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Deilenaar_ny%C3%BAl.jpg/210px-Deilenaar_ny%C3%BAl.jpg'),
    petType(Text: 'The American Rabbit Breeders Association standard calls for a small to medium rabbit. Dutch are a 4-class breed. Junior bucks and does are those under 6 months of age with a minimum weight of 1.75 lbs (0,793 kg). Seniors are 6 months of age and over, weighing between 3.5 (1,58 kg) and 5.5 lbs (2,48 kg), with 4.5 (2,04 kg) being the ideal weight. Dutch are to have a compact, well-rounded body; rounded head; short, stocky, well-furred ears; and short, glossy "flyback" fur. Six colors (in conjunction with white) are recognized for show: Black, a dense, glossy black with a slate blue undercolor. Eyes—dark brown. Blue, a medium blue-gray with a slate blue undercolor. Eyes—blue-gray. Chinchilla, an agouti color with bands of pearl white and black with a slate blue undercolor. The ears must have black lacing. Eyes—brown (preferred). Chocolate, a rich chocolate brown with a dove-gray undercolor. Eyes—brown (with a ruby cast). Gray, (UK: Brown Grey) an Agouti color similar to that of the American cottontail, with bands of color on the hairshaft which produce a ring effect when blown into. The bands of color should be a light tan, a thin charcoal band then a darker tan over a slate blue undercolor. Eyes—dark brown.',
        bread: 'Dutch rabbit',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/American_Grand_Champion_Dutch_Rabbit.jpg/210px-American_Grand_Champion_Dutch_Rabbit.jpg'),
    petType(Text: 'The English Lop is a fancy breed of domestic rabbit that was developed in England in the 19th century through selective breeding. It is believed to be the first breed of lop rabbit developed by humans,[1] and it may be one of the oldest breeds of domestic rabbit.[2] Averaging 11 pounds (5.5 kg), the English Lop is characterized by its distinctively long lop ears, bold head, and large body size.',
        bread: 'English Lop',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/English_Lop_Rabbit.jpg/330px-English_Lop_Rabbit.jpg'),
    petType(Text: 'As one of the largest breeds of domestic rabbit, the Flemish Giant is a semi-arch type rabbit with its back arch starting behind the shoulders and carrying through to the base of the tail, giving a "mandolin" shape. The body of a Flemish Giant Rabbit is long and powerful, with relatively broad hindquarters. The fur of the Flemish Giant is glossy and dense. When stroked from the hindquarters to the head, the fur will roll back to its original position. Bucks have a broad, massive head in comparison to does, and can take 1.5 years to reach full maturity. Does may have a large, full, evenly carried dewlap (the fold of skin under their chins), and can take 1 year to reach full maturity. Flemish Giant Rabbits weigh 6.8 kilograms (15 lb) on average, though the largest ones can weigh up to 10 kilograms (22 lb). The longest one on record (which holds the record for the longest rabbit in the world of any kind), measured about 1.3 metres (4 ft 3 in) long',
        bread: 'Flemish Giant rabbit',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Geant_des_flandres_101.JPG/330px-Geant_des_flandres_101.JPG'),
    petType(Text: 'The Florida White is also an excellent show animal. The Florida White Standard of Perfection, which is available from the ARBA, describes the point system used to judge the Florida White. The number one consideration in showing the Florida White is the body or type which carries 65 points, though the condition of the rabbit which would include firm flesh and fur carries 35 points.[citation needed] The fur is white with good density and texture, and they have a compact, meaty body, short neck, and small head. The ideal senior weight for the breed is 5 pounds, with an acceptable range from 4-6 pounds while the junior weighs 2.25-4.5 pounds.',
        bread: 'Florida White',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Floridawhiterabbit.jpg/330px-Floridawhiterabbit.jpg'),
    petType(Text: 'he French Lop is a very large rabbit, typically weighing around 10-15 pounds. They do not have a maximum weight in the show standard. Their ears are typically between 5 and 8 inches long and hang down below the jaw. They have a stout, thickset body and a large head. The front legs are short and straight and the hind legs are carried parallel to the body. The French Lop has a dense, soft coat that comes in two colour varieties: solid and broken. Within these categories can be found a number of different colour variations, including agouti, black, chinchilla, and fawn.',
        bread: 'French Lop',
        image: 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Loprabbit.JPG'),
    petType(Text: 'The Mellerud rabbit is similar to the Gotland rabbit in terms of conformation. It is a medium-sized rabbit with an adult weight of 3–3.5 kg (6.6-7.7 lbs). The body of the doe is relatively elongated with a fine head while the buck is usually somewhat more compact with a rounder head and thicker muzzle. There is no weight difference between the genders. The ears are of medium length and relatively thin, pointed rather than rounded. The eyes are somewhat large with an alert expression. The eyes are brown, blue or a mixture of the two.',
        bread: 'Mellerud rabbit',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Mellerud_rabbit.jpeg/450px-Mellerud_rabbit.jpeg'),
    petType(Text: 'Lionhead is a breed of domestic rabbit recognized by the British Rabbit Council  and by the American Rabbit Breeders Association The Lionhead rabbit has a wool mane encircling the head, reminiscent of a male lion as its name implies. Other Lionhead characteristics include a high head mount, compact upright body type, short well-furred 2- to 3 1/2-inch ears, and a weight of 2.5 to 3.75 pounds.',
        bread: 'Lionhead rabbit',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Lionhead_rabbit_Dobby.jpg/330px-Lionhead_rabbit_Dobby.jpg'),
    petType(Text: 'Despite having never been bred towards a written breed standard until recent times, most Gotland rabbits share a distinctive and recognizable type. The variety is of medium size with an adult weight of 3–4 kg (6.6-8.8 lb). The body of the doe is relatively elongated with a fine head while the buck is usually somewhat more compact with a rounder head and thicker muzzle. There is no weight difference between the genders. The ears are of medium length and relatively thin, pointed rather than rounded. The eyes are somewhat large with an alert expression. Any eye colour is allowed. The coat is short and fine, usually straight although a few rex coated Gotlands have been known. Any pattern and colour is allowed',
        bread: 'Gotland rabbit',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Gotlandskanin_Vallby.jpg/450px-Gotlandskanin_Vallby.jpg'),
    petType(Text: 'For competitions, a Mini Rex should have a well-rounded back, with well-developed and filled shoulders, midsection and hindquarters. The head should be well-filled and set on a short neck, with thick ears measuring no more than 3.5 inches. They should have medium-fine bone and rather short legs. Fur should be extremely dense, straight, and upright. It should be smooth and springy, not too soft or silky. Fur must be between 1/2 inch and 7/8 inch long. Any missing toe nails can lead to disqualification of the rabbit.',
        bread: 'Mini Rex',
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Fast_Track%2C_Lilac_Mini_Rex.jpg/330px-Fast_Track%2C_Lilac_Mini_Rex.jpg'),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rabbits Breed',style: TextStyle(color:Colors.black),),
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