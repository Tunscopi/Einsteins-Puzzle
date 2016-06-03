----------------------- code --------------------------

<'

type color_t : [ RED, GREEN, IVORY, YELLOW, BLUE ];
type nationality_t : [ ENGLISH, SPANISH, UKRANIAN, NORWEGIAN, JAPANESE ];
type pet_t : [ DOG, SNAILS, FOX, HORSE, ZEBRA ];
type drink_t : [ COFFEE, TEA, MILK, ORANGE_JUICE, WATER ];
type cigarettes_t : [ OLD_GOLD, KOOL, CHESTERFIELD, LUCKY_STRIKE, PARLIAMENT ];

struct house_s {
  color       : color_t;
  nationality : nationality_t;
  pet         : pet_t;
  drink       : drink_t;
  cigarettes  : cigarettes_t;
  print_me() is {messagef(NONE,"House Info %s %s %s %s %s",color,nationality,pet,drink,cigarettes)}
};


extend house_s {
  keep nationality == ENGLISH => color == RED;//2
  keep nationality == SPANISH => pet == DOG;//3
  keep nationality == UKRANIAN => drink == TEA;//5
  keep nationality == JAPANESE =>  cigarettes == PARLIAMENT;//14
  keep drink == COFFEE => color == GREEN;//4
  keep cigarettes == OLD_GOLD => pet == SNAILS;//7
  keep cigarettes == KOOL => color == YELLOW;//8
  keep cigarettes == LUCKY_STRIKE => drink == ORANGE_JUICE;//13  
};

extend sys {
  houses[5] : list of house_s;//1
  keep houses.all_different(it.color); 
  keep houses.all_different(it.pet);
  keep houses.all_different(it.drink);
  keep houses.all_different(it.cigarettes);
  keep houses.all_different(it.nationality);
  
  keep for each (house) in houses {
    (index == 2) => house.drink == MILK;//9
    (index == 1) => house.color == BLUE;//15
    (index == 0) => house.nationality == NORWEGIAN;//10
    (house.color == IVORY) =>  houses[index + 1].color == GREEN;//6
    (house.cigarettes == KOOL) =>  (houses[index + 1].pet == HORSE ||  houses[index - 1].pet == HORSE);//12
    (house.cigarettes == CHESTERFIELD) =>  (houses[index + 1].pet == FOX ||  houses[index - 1].pet == FOX);//11
     
     // Additional constraints (explanation in ReadMe)
     (index == 0) => house.color == YELLOW;
     (index == 0) => house.cigarettes == KOOL; 
     (index == 1) => house.pet == HORSE;
     (index == 0) => house.drink == WATER;
     (index == 0) => (house.pet == FOX ||house.pet == ZEBRA);
     (index == 1) => (house.nationality == JAPANESE || house.nationality == UKRANIAN);
     (index == 2) => (house.color == IVORY || house.color == RED);
     (index == 3) => (house.color == IVORY || house.color == GREEN);
     (index == 4) => (house.color == GREEN || house.color == RED); 
};
    
    run() is also {
    	for each (h) in houses {h.print_me()};
    }
};

'>
