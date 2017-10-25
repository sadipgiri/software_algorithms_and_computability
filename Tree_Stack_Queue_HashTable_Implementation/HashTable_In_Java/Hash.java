
import java.util.ArrayList;
 
class HashNode<Key, Value>
{
    Key key;
    Value value;
 
    HashNode<Key, Value> next;
 
    public HashNode(Key key, Value value)
    {
        this.key = key;
        this.value = value;
    }
}
 
class Hash<Key, Value>
{
    private ArrayList<HashNode<Key, Value>> bucketArray;
 
    private int numBuckets;
 
    private int size;
 
    public Hash()
    {
        bucketArray = new ArrayList<>();
        numBuckets = 10;
        size = 0;
 
        for (int i = 0; i < numBuckets; i++)
            bucketArray.add(null);
    }
 
    public int size() { 
        return size; 
    }


    public boolean isEmpty() {
        return size() == 0; 
    }
    

    // We are using java's hashValue method of all the types, 
    // but in case we wanted our own hash function :)
    
    public int getCustomHashValueForString(String s){
        hv = 0;
        for (int i = 0; i < s.length(); i++) {
            hv += (int)s.charAt(i);
        }
        return hv d% this.numBuckets;
    }

    private int getBucketIndex(Key key)
    {
        int hashCode = key.hashCode();
        int index = hashCode % numBuckets;
        return index;
    }
 
    public Value remove(Key key)
    {
        // Apply hash function to find index for given key
        int bucketIndex = getBucketIndex(key);
 
        // Get head of chain
        HashNode<Key, Value> head = bucketArray.get(bucketIndex);
 
        // Search for key in its chain
        HashNode<Key, Value> prev = null;
        while (head != null)
        {
            // If Key found
            if (head.key.equals(key))
                break;
 
            // Else keep moving in chain
            prev = head;
            head = head.next;
        }
 
        // If key was not there
        if (head == null)
            return null;
 
        // Reduce size
        size--;
 
        // Remove key
        if (prev != null)
            prev.next = head.next;
        else
            bucketArray.set(bucketIndex, head.next);
 
        return head.value;
    }
 
    public Value get(Key key)
    {
        int bucketIndex = getBucketIndex(key);
        HashNode<Key, Value> head = bucketArray.get(bucketIndex);
 
        while (head != null)
        {
            if (head.key.equals(key))
                return head.value;
            head = head.next;
        }
         return null;
    }
 
    public void add(Key key, Value value)
    {
        int bucketIndex = getBucketIndex(key);
        HashNode<Key, Value> head = bucketArray.get(bucketIndex);
 
        while (head != null)
        {
            if (head.key.equals(key))
            {
                head.value = value;
                return;
            }
            head = head.next;
        }
 
        size++;
        head = bucketArray.get(bucketIndex);
        HashNode<Key, Value> newNode = new HashNode<Key, Value>(key, value);
        newNode.next = head;
        bucketArray.set(bucketIndex, newNode);
 
        // If load factor goes beyond threshold, then double hash table size to accomodate other data
        if ((1.0*size)/numBuckets >= 0.8)
        {
            ArrayList<HashNode<Key, Value>> temp = bucketArray;
            bucketArray = new ArrayList<>();
            numBuckets = 2 * numBuckets;
            size = 0;
            for (int i = 0; i < numBuckets; i++)
                bucketArray.add(null);
 
            for (HashNode<Key, Value> headNode : temp)
            {
                while (headNode != null)
                {
                    add(headNode.key, headNode.value);
                    headNode = headNode.next;
                }
            }
        }
    }
 
    public static void main(String[] args)
    {
        Hash<String, Integer>hashtable = new Hash<>();
        hashtable.add("Aayush",1);
        hashtable.add("Sashank",2);
        hashtable.add("Sadip",3);
        hashtable.add("Aaaakash",5);
        System.out.println(hashtable.size());
        System.out.println(hashtable.remove("Sadip"));
        System.out.println(hashtable.size());
        System.out.println(hashtable.isEmpty());
    }
}