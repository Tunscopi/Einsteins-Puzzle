<'
   // define Macro for neighbor statements
   define <neighbor'statement> "<first'exp> neighbors <second'exp>" as {
       extend neighborhood_s {
       	   keep for each (house) in houses {
               house.<first'exp> => index < 4 and houses[index+1].<second'exp> ||
                                    index > 0 and houses[index-1].<second'exp>; 
           } ;
       };
   }; 
 
extend house_s {
     keep nationality == ENGLISH => color == RED; //2
     keep nationality == SPANISH => pet == DOG; //3
     keep nationality == UKRANIAN => drink == TEA; //5
     keep nationality == JAPANESE => cigarettes == PARLIAMENT; //14
     keep drink == COFFEE => color == GREEN; //4
     keep cigarettes == OLD_GOLD => pet == SNAILS; //7
     keep cigarettes == KOOL => color == YELLOW; //8
     keep cigarettes == LUCKY_STRIKE => drink == ORANGE_JUICE; //13
};

     cigarettes == CHESTERFIELD neighbors pet == FOX;

extend neighborhood_s {
     keep for each (house) in houses {
         (index == 2) => house.drink == MILK; //9
         (index == 1) => house.color == BLUE; //15
         (index == 0) => house.nationality == NORWEGIAN; //10

         // Neighborhood statements
         (house.color == IVORY) => houses[index+1].color == GREEN; //6
         //(house.cigarettes == KOOL) => (houses[index+1].pet == HORSE || houses[index-1].pet == HORSE); //12  (Rendered redundant by some of additional constraints)
        (house.cigarettes == CHESTERFIELD) => (houses[index+1].pet == FOX || houses[index-1].pet == FOX); //11 
                  

         // Additional constraints (explanation in ReadMe)
         (index == 0) => house.color == YELLOW;
         (index == 0) => house.cigarettes == KOOL;
         (index == 1) => house.pet == HORSE;
         (index == 0) => house.drink == WATER;
         (index == 0) => (house.pet == FOX || house.pet == ZEBRA);
         (index == 1) => (house.nationality == JAPANESE || house.nationality == UKRANIAN);
         (index == 2) => (house.color == IVORY || house.color == RED);
         (index == 3) => (house.color == IVORY || house.color == GREEN);
         (index == 4) => (house.color == GREEN || house.color == RED);
     }
	
}


'>
