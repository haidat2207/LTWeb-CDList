package business;

import java.io.Serializable;
import java.util.ArrayList;


public class Cart implements Serializable {
    private final ArrayList<LineItem> items = new ArrayList<>();

    public Cart(){}

    public ArrayList<LineItem> getItems() {
        return items;
    }
    public int getCount() {
        return items.size();
    }

    public void addItem(Product product) {
        for (LineItem li : items) {
            if (li.getProduct().getId().equals(product.getId())) {
                li.setQuantity(li.getQuantity() + 1);
                return;
            }
        }
        items.add(new LineItem(product, 1));
    }

    public void updateItem(String id, int quantity) {
        for (LineItem li : items) {
            if (li.getProduct().getId().equals(id)) {
                if (quantity > 0) li.setQuantity(quantity);
                else items.remove(li);
                return;
            }
        }
    }

    public void removeItem(String id) {
        items.removeIf(li -> li.getProduct().getId().equals(id));
    }

    public double getTotal() {
        double total = 0;
        for (LineItem li : items) {
            total += li.getTotal();
        }
        return total;
    }
}