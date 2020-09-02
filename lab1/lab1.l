%{
  #include<stdio.h>
%}

%%
[\t\n\r" "]+ {return 10;}
[0-9]+ {return 1;} //number
[a-zA-Z]+[a-zA-Z0-9]*[-][a-zA-z0-9]+  {return 2;} //function
[;][a-zA-Z0-9|" "]*[^\w\s|" " ]* {return 4;}    //comment
[a-zA-Z]+[0-9]* {return 5;} //variables and (if, let and so on)
. {return 6;} //others
%%

int main(){

  while(1){
    int token = yylex();
    if(token==0) break;
    if(token ==1) printf("my number: %s\n", yytext);
    if(token ==2) printf("my function: %s\n", yytext);
    if(token ==4) printf("comment: %s\n", yytext);
    if(token ==5) printf("variables:%s\n", yytext);
    if(token ==6) printf("others:%s\n", yytext);
  }
}

