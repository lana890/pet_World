import 'package:flutter/material.dart';
import 'package:pet_world/models/petType.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/single_child_widget.dart';

class CatsScreen extends StatelessWidget {
  final List<petType> breeds=[
    petType(Text: 'Confident and friendly, the American Bobtail is a highly intelligent breed with a clownlike personality. Looking much like a bobtailed wildcat, this rare and athletic breed can be taught to walk on a leash. The American Bobtail has two coat varieties, shorthair and longhair, and does not reach adulthood until 2 or 3 years old. A devoted family companion, this cat interacts well with people of all ages and is ideal with children.DID YOU KNOW?The American Bobtail has a naturally short bob tail that can be seen clearly above the back when the cat is alert. No tail is exactly the same, but the average length is 2.5 to 10.5 centimetres.',
        bread: 'American Bobtail',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-07/american-bobtail-body-small-70p.webp?itok=_CHlOZKl'),
    petType(Text: 'Ancestors of the American Shorthair hunted rats on the ships of early European settlers. These cats flourished alongside the pioneers, eventually becoming the native North American shorthair cat. A true working breed, the American Shorthair is strongly built. This healthy, long-lived cat stands out for her beauty and quiet disposition and makes an ideal companion for families with children and those having cat friendly dogs.DID YOU KNOW? The American Shorthair, originally known as the Domestic Shorthair, became one of the first five breeds recognized in the U.S. when it was registered in 1906. The breed was renamed the American Shorthair in 1966 to better capture its “All-American” character.',
        bread: 'American Shorthair',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-07/american-shorthair-body-70p.webp?itok=HW6ysdKn'),
    petType(Text: 'A Siamese in every nature except for her long, silky ermine coat, the Balinese, also known as the Javanese, has a distinctive luxurious tail plume. This long, slender cat is lithe but muscular. An easygoing breed with a clownlike personality, the Balinese adores people. This regal, aristocratic, intelligent cat is talkative, though less vocal than the Siamese. A healthy breed, the Balinese can live up to 20 years.DID YOU KNOW? The long, elegant body of the Balinese prompted the breed being named after the graceful dancers from the island of Bali',
        bread: 'Balinese-Javanese',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-07/javanese-body-70p.webp?itok=eZKA89ER'),
    petType(Text: 'The regal beauty and alluring charm of the Bengal make this feline one of the most popular breeds. Its richly coloured, highly contrasted coat of vivid spots or distinctive marbling, similar to jungle cats, is stunning. A docile, civilised house cat, the Bengal enjoys playing, chasing, climbing, and investigating. This breed is affectionate and adores being wherever you are.DID YOU KNOW? The Bengal, which takes its name from the scientific name for Asian Leopard Cat, Priionailurus bengalensis, is the only domestic cat that has rosettes like the markings on leopards, jaguars and ocelots.',
        bread: 'Bengal',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0039_Bengal.webp?itok=KH-Vy_rq'),
    petType(Text: 'With her marvelous, social personality, the Birman doesn’t like being the only animal in the house. She is active and playful but quiet if you are busy. This healthy, long-lived breed has an outstanding semi-long silky coat that does not mat and a luxurious, long bottle-brush tail. Brilliant blue, almost-round eyes are prominent features of her sweet expression.DID YOU KNOW?: A cat of mystery and legend, the Birman was the sacred cat of Burma, believed to be the companions of the priests of the temple.',
        bread: 'Birman',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0038_Birman.webp?itok=ieNbK4n7'),
    petType(Text: 'The Burmilla cat breed is of medium build, similar to Burmese cats, with a sturdy, well muscled body and a strong straight back. The female is much smaller and daintier than the male. The head has a gently rounded dome, a wedge shaped muzzle and wide set ears. The expressive eyes may be any colour from gold through to green. The coat is short and close lying with a pale undercoat and even tipping (darker colour at the tip of the hairs) over the rest of the body and a distinct "M" marking on the forehead.',
        bread: 'Burmilla',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0034_Burmilla.webp?itok=80IJmgCa'),
    petType(Text: 'The Chinchilla cat comes in one colour - white with green eyes. It has a broad head with small wide-set ears and a short open face. The eyes are large and round with brilliant colour. Although the Chinchilla cat tends to be more finely boned than most Persian cats, its legs are still fairly short, thick and strong. The tail is short and bushy. The coat is long, thick and luxuriant with a dense, soft undercoat.',
        bread: 'Chinchilla',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0033_Chinchilla_OG.webp?itok=OykBC-SN'),
    petType(Text: 'The Cymric cat breed is solidly built and chunky with a similar body type to the British Shorthair cat breed with large eyes and widely spaced ears. The lack of a tail is the breeds most outstanding feature. Its hind legs are longer than the front legs. The Cymric cats hair is thick and provides a layer of padding over the main body, adding to the round appearance. A rabbit-like hop can sometimes be seen in Cymric cats because of the spinal deformity, similar to spinabifida, which associated with the taillessness. Cymric cats come in all colours and patterns, except the pointed Siamese cat breed type.',
        bread: 'Cymrics',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0031_Cymrics.webp?itok=_UODE1N8'),
    petType(Text: 'A rare Thai breed, the Korat is an affectionate constant companion that is gentle and good with children. Though this cat has an action-packed personality, the Korat moves slowly and cautiously and does not like sudden, loud noises. The breed is said to have extraordinary powers of hearing, scent and sight. The Korat’s silver-tipped blue coat, described in Thailand as rain-cloud gray, has a shimmering effect.DID YOU KNOW? Discovered in the Korat province of Thailand, the Korat has been cherished in her native Thailand for centuries as a symbol of good fortune. The expressive, oversized eyes of the Korat have an intense gaze that is said to take one’s breath away. The eyes are blue at birth but change to amber with green around the pupil during adolescence and then luminous green in two to four years.',
        bread: 'Korat',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0024_Korat.webp?itok=X1yTsStr'),
    petType(Text: 'Recognised for having a bushy tail, shaggy coat and tufted ears, the Maine Coon is a hardy breed capable of enduring harsh climates. Referred to as a “gentle giant,” the Maine Coon is a popular companion that is good with children and dogs. This slow-maturing feline does not reach full growth for four or five years, yet is kittenlike well into old age. The Maine Coon loves nature and is particularly fascinated by water.DID YOU KNOW? In 1985, this all-American breed became the official state cat of Maine.',
        bread: 'Maine Coon',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0022_Maine_coon.webp?itok=LhD0vLe7'),
    petType(Text: 'The Norwegian Forest Cat is gorgeous, having bright emerald green eyes, a long flowing, silky coat, full mane, and magnificent 30.5 centimetre tail. This people-oriented breed is gentle and loving, including to other animals. A hardy, healthy feline that is naturally curious and athletic, the Norwegian Forest Cat is patient and not stressed easily. This breed is slow maturing, reaching full growth in about five years.DID YOU KNOW? The cat of the Vikings, the Norwegian Forest Cat protected grain stores on land and sea from rodents. It is believed that these cats left their progeny on the shores of North America, explaining the breed’s presence on this continent.',
        bread: 'Norwegian Forest',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0019_Norwegian_forest.webp?itok=1lRrHuPC'),
    petType(Text: 'Oriental Longhair cats feature a long, lithe and elegant, Siamese-style body with a triangular wedge-shaped head and ears. The coat is long and silky, but unlike the Persian cat, there is no woolly undercoat and coat lies flat against the body and so is officially classified as a semi-longhair. The tail forms a magnificent plume. The range of possible coat colours includes everything from solid colours to smokes, tipped or tabby types. All Oriental Longhair cats have almond-shaped green eyes, except for the whites, which may have green or blue eyes, or be odd-eyed (two different coloured eyes).',
        bread: 'Oriental Long Hair',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0017_Oriental_longhair.webp?itok=oR7I0clk'),
    petType(Text: 'The Ragdoll is one of the most popular longhair cat breeds. Social and loving, this cat enjoys people and gets along well with children and dogs. The desire to be near her family has earned her the affectionate nickname “puppycat.” The Ragdoll can be taught to fetch and come when called. Playful throughout their lives, these cats mature slowly in three to four years. DID YOU KNOW? The Ragdoll originated in the early 1960s when a Persian breeder, Ann Baker of Riverside, Calif., bred a semi-feral longhaired white cat resembling an Angora to cats she found or owned. The offspring of “Josephine” had unique, endearing temperament traits that Baker selectively bred in creating the breed.',
        bread: 'Ragdoll',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0013_Ragdoll.webp?itok=5KBg1JXD'),
    petType(Text: 'The Snowshoe cat is a medium sized breed and combines the solid heftiness of the American Shorthair with the lithe elegance of the Siamese. The head is a rounded triangle, the eyes are large and slanting and their large, pointed ears are set wide apart. Their body is long and athletic and their coat is short and glossy with the mask, ears, legs and tail much darker in colour than the body. Snowshoe cats come in blue, seal, lilac and chocolate varieties and the white areas cover less than one third of the cat. The eyes of all Snowshoe cats are a deep blue.',
        bread: 'Snowshoe',
        image: 'https://www.purina.co.nz/sites/default/files/styles/ttt_image_original/public/2021-02/CAT%20BREED%20Hero%20Desktop_0005_Snowshoe.webp?itok=ZCIQyvz6')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cats Breed',style: TextStyle(color:Colors.black),),
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