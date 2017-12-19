#include <stdio.h>
#include <stdlib.h>

//declaring student structure
typedef struct{
    int stdNbr;
    char stdName[20];
    char sex;
    float mark1, mark2, mark3, mark4, mark5;
    float total;
}student;

// function prototypes - see below
int search(student st[], int id, int counter);
void clean(student st[], int deleteitem);
void displayheading();
/* Defining the displaymenu() function to display the menu.
* The simple menu provides nine choices from 1 to 9 to work with the records.*/
void displaymenu(){
    printf("-----------------------------------------------\n");
    printf("- MENU                          please choose -\n");
    printf("-----------------------------------------------\n");
    printf("1. Add students record\n");
    printf("2. Delete students record\n");
    printf("3. Update students record\n");
    printf("4. View all students record\n");
    printf("5. Calculate average score of student\n");
    printf("6. Show student who gets the highest total score\n");
    printf("7. Show student who gets the lowest total score\n");
    printf("8. Find student by id\n");
    printf("9. Sorts record by total\n");
}
/* Defining the add_rec(student[] st, int *counter) function to add
* a new record to the the array of student objects.
* This function takes two arguments.
* The first argument is the array of student objects(st) and
* the second argument is the number of items in the array.
* This function firstly checks the new record
* (using the search function that is defined in the next step)
* before it is allowed to be appended to the array to avoid duplicate records.
* When the new item is added the value of counter variable increases
* by 1 that means the number of records in the list increases.
*/
void add_rec(student st[], int *counter){
    char id[10];
    printf("Enter student number: ");
    scanf("%d", &id);
    if(search(st, id, counter) < 0){
        st->stdNbr = id;
        printf("Enter student sex: ");
        scanf("%c", &st->sex);
        printf("Enter mark 1: ");
        scanf("%f", &st->mark1);
        printf("Enter mark 2: ");
        scanf("%f", &st->mark2);
        printf("Enter mark 3: ");
        scanf("%f", &st->mark3);
        printf("Enter mark 4: ");
        scanf("%f", &st->mark4);
        printf("Enter mark 5: ");
        scanf("%f", &st->mark5);
        st->total = (*st).mark1 + (*st).mark2 + (*st).mark3 + (*st).mark4 + (*st).mark5;
    }
    printf("Mark 2: %f", st->mark2);
    printf("Total: %f", st->total);
    (*counter)++;
}

/* Defining the search(struct st[], char id[], int counter)
* function to search for the index of a target record.
* This function is useful as we need it to find the location
* of the target record in the array of student objects.
* It can help us to make sure the record does exist before
* we allow the record for deleting or updating.
* If the target element is found, the function returns
* the index of this element.
* It return -1, if the target element is not found in the array.
*/
int search(student st[], int id,int counter) {
    for (int i = 0; i < counter; i++) {
        if ((*st).stdNbr == id) {
            return i;
        }
        st++;
    }
    return -1;
}
/* Defining the displayAll(student st[], int counter)
* function to display the list of all records in the set.
* To display all records, we need a while loop
* to traverse through the array of student objects.
*/
void displayAll(student st[], int counter){
    displayheading();

}

void displayheading(){
    printf("ID NAME SEX Q1 Q2 As Mi Fi TOTAL \n");
    printf("==================================================\n");
}

/* Defining the delete(student st[], int *counter) function
* to delete a target record from the array of student objects.
* The user will be prompted to enter the id of student record
* that his/her wants to delete.
* Then this id will be checked to make sure it does exist in the list.
* If the target record or element really exists, the deletion process can be made.
* The deletion process starts by checking whether the target record
* is the last record, beginning or middle record.
* If the target record is the last record in the list, we simply
* delete the record by supplying it to the clean(struct student st[], int index) method.
* The last record is the record that has it index equal to itemcount subtracted by 1.
* If the target record stays at the beginning or in the middle of the list,
* we need to use a loop to allow the previous element to take over the next element.
* This process continues until it reaches the end of the list(itemcount-1).
* Then the clean() method is called to clean the last element of the list that should not
* exit.
* After the element is cleaned, the itemcount variable decreases by 1.
* This means that the number of elements in the list decreases.
 */
void delete_rec(student st[], int *counter){

}
//function to clean up deleted record
void clean(student st[],int index){}
/* Defining the update_reg(student st[], int counter)
* function to update a specified record.
* The update process starts by asking the user to input
* the id of the record to be changed.
* The id value is checked to make sure it really exists.
* If it exists the change to the target record can be made after
* asking the user to input the new value of the field that need change.
* */
void update_rec(student st[],int counter){

}
/* This function calculates and display the student record with the highest score. */
void showmax(student st[], int counter){

}
/* This function calculates and display the student record with the lowest score. */
void showmin(student st[], int counter){

}
/* This function asks for a students ID and displays the found record
* If the record cannot be found display a explaining message.
*/
void find(student st[], int counter){

}
// function to sort records by total score
// you can also use another algorithm
void bubblesort(student dataset[], int n){

}

/* Defining the average(student[] st, int counter) function to
* calculate the average score of a selected student.
* The function also starts by asking the user to input the id of the target student.
* This id is checked to make sure it really exists.
* The average score can be calculated by dividing the sum of
* mark1, mark2, mark3, mark4, and mark5 score by 5.
*/
void average(student st[], int counter){}
//the main function
int main(int argc, char *argv[]){
    // define an array of 20 students
    student st[20];

    int counter=0;
    //show menu
    displaymenu();
    int choice;
    char confirm;
    do{
        printf("Enter your choice(1-9): ");
        scanf("%d",&choice);
        switch(choice){
            case 1: add_rec(st, &counter); break;
            case 2: delete_rec(st, &counter); break;
            case 3: update_rec(st, counter); break;
            case 4: displayAll(st, counter); break;
            case 5: average(st, counter); break;
            case 6: showmax(st, counter); break;
            case 7: showmin(st, counter); break;
            case 8: find(st, counter); break;
            case 9: bubblesort(st, counter); break;
            default: printf("invalid\n");
        }
        printf("\nPress y or Y to continue: ");
        scanf("%s",&confirm);
    }while(confirm=='y'||confirm=='Y');
    return 0;
}