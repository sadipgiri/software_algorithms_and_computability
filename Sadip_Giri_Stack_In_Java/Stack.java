
public class Stack {
    int sArray[] = new int[5];  // just defined it because I had a null pointer exception here
                                // Dynamic array in Java?
                                // Linked List'd be the best choice
    int track = -1;

    public void push(int element) {
        //sArray.add(element);
        sArray[track + 1] = element;
        track = track + 1;
    }

    public int pop() {
        int popUp = sArray[track];
        track = track - 1;
        return popUp;
    }

    public static void main(String[] args) {
        Stack stack1 = new Stack();
        stack1.push(1);
        stack1.push(2);
        System.out.println(stack1.pop());
    }
}