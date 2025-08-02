import java.util.List;

class Knapsack {

    int maximumValue(int maximumWeight, List<Item> items) {
        int[] sack = new int[maximumWeight + 1];
        for(Item item: items) {
            for(int w = maximumWeight; w >= item.weight; w--) {
                sack[w] = Math.max(sack[w], sack[w - item.weight] + item.value);
            }
        }
        return sack[maximumWeight];
    }

}