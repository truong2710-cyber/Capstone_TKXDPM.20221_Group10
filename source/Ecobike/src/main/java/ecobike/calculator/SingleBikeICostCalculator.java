package ecobike.calculator;

public class SingleBikeICostCalculator implements ICostCalculator {
    @Override
    public int calculateCost(int duration) {
        //free if time is smaller than 10 minutes
        if (duration <= 10) {
            return 0;
        }

        // 10,000VND for the first 30 minutes
        int cost = 10000;
        duration -= 30;
        if (duration <= 0) return cost;
        int period = (int) Math.ceil(duration / 15.0);
        cost += period * 3000;
        return cost;
    }
}
