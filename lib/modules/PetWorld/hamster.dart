import 'package:flutter/material.dart';
import 'package:pet_world/models/petType.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/single_child_widget.dart';

class hamistarScreen extends StatelessWidget {
  final List<petType> breeds=[
    petType(Text: 'The smallest of the popular hamster breeds, the Roborovski dwarf hamster (Phodopus roborovski) matures to just 2 inches long. On average, these hamsters live about three years. Because this breed is so tiny, it is best to use an aquarium with a mesh lid to house these hamsters. They can easily escape through the spacing in wire cages. The Roborovski is a quick-moving hamster. It is an agile breed and loves to be active. Be sure to provide this hamster with plenty of toys and activities. These hamsters can be handled but are happiest left alone. Their tiny size and agile nature mean that they can easily wriggle out of your grasp and get lost. They can be social and do well in same-sex groups as long as they are properly introduced. If you would like to own multiple hamsters, the dwarf Roborovski is a great choice.',
        bread: 'Dwarf Roborovski',
        image: 'https://www.thesprucepets.com/thmb/Ke1tmbWPNZ51oIeafd8bEms0GPA=/434x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1157798585-41025aa3b70f4615b234fd9fb30d7d1b.jpg'),
    petType(Text: 'The Campbell’s dwarf Russian hamster (Phodopus campbelli) grows to a maximum of 4 inches and has an average life expectancy of two years. This is another social breed that can be kept in same-sex groups as long as the hamsters are properly introduced. The Campbell’s dwarf Russian hamster is a quick little animal and may be prone to nip if they feel threatened or frightened. They are friendly hamsters and do not mind being held if it is done properly. Though nocturnal, these hamsters may wake for short periods throughout the day.',
        bread: 'Campbell’s Dwarf Russian',
        image: 'https://www.thesprucepets.com/thmb/TiDk1j7VHzQHW0arQemDo3fYFa8=/434x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-497336201-853468639f5c4a43ab54222f15d92b77.jpg'),
    petType(Text: 'Also known as golden or teddy bear hamsters, the Syrian hamster (Mesocricetus auratus) is the most popular pet hamster, especially for children. They range from from 5 to 9 inches in length and have a lifespan of two to four years. Through selective breeding, you can find this hamster in a wide range of colors and coat lengths, though typically they are golden-brown and white. The Syrian hamster is the best species for handling. It is easy to tame, the slowest of the popular pet hamsters, and the least likely to bite. Though docile with humans, they are territorial with other hamsters and should always be housed alone. They will fight if housed in groups. The Syrian is true to its nocturnal nature and is rarely active during the day. Early morning or late evening are the best times to interact with this hamster.',
        bread: 'Syrian Hamster',
        image: 'https://www.thesprucepets.com/thmb/t3BCGw7ph3ALIKi7iyPYHYZ9UL8=/434x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-525140239-8808998be45e4bfa9140ae9dbcfe2d79.jpg'),
    petType(Text: 'The dwarf winter white Russian (Phodopus sungorus) is similar to the Campbell’s dwarf Russian hamster. They are typically 3.5 to 4 inches long and live about two years. They are rounder and have shorter faces than the Campbells. Its fur can turn white in winter. The dwarf winter white Russian is very docile and is less likely to bite than many other hamster species. They are quick and agile and may be difficult to handle for children. You can keep this hamster breed in same-sex pairs or groups as long as they are properly introduced at a young age. However, even hamsters raised together can turn territorial and may need to be separated when older. It would be best if you housed this small breed in an aquarium tank with a mesh lid; it could slip through a regular wire cage spacing.',
        bread: 'Dwarf Winter White Russian',
        image: 'https://www.thesprucepets.com/thmb/9G1acRd3LR7vRUPOzEwga4ZNz_8=/434x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1133471852-250071b3446d4aac858991f1f9bc0a17.jpg'),
    petType(Text: 'The Chinese hamster (Cricetus griseus) can get up to five inches long. They can live up to three years. This species is known for being friendly and comfortable with handling if they are consistently tamed and handled from a young age. If they are not accustomed to being handled, they can be timid and nervous, which can lead to nipping. They are tiny and quick and can easily squirm out of your hands. Always be cautious when handling a hamster and be aware of how high you are holding them. Stay close to the ground to avoid high falls. The Chinese hamster is another friendly species that can be kept in same-sex groups or pairs.',
        bread: 'Chinese Hamster',
        image: 'https://www.thesprucepets.com/thmb/xlJRTVxRPnQjHOCwu_8XxVHG5Jc=/434x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-505573262-61c543a6195d41bbbb132f133c6b507c.jpg'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hamisters Breed',style: TextStyle(color:Colors.black),),
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
              ]),


            ],
          ),
        )



    );
  }
}