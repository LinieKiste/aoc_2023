fn main() {
    let input = include_str!("input.txt");
    let truth = (12, 13, 14);
    let mut result = 0;
    for line in input.lines() {
        let mut max_cols = (0, 0, 0);
        let (game, draws) = line.split_once(':').unwrap();
        let game_no: u32 = game.split_whitespace().last().unwrap().parse().unwrap();
        for draw in draws.split(',') {
            let draw = draw.trim().split("; ");
            for sample in draw {
                let (amount, col) = sample.split_once(" ").unwrap();
                let amount = amount.parse::<u32>().unwrap();
                if col == "red" && amount > max_cols.0 {
                    max_cols.0 = amount;
                } else if col == "green" && amount > max_cols.1 {
                    max_cols.1 = amount;
                } else if col == "blue" && amount > max_cols.2 {
                    max_cols.2 = amount;
                }
            }
        }
        let power = max_cols.0 * max_cols.1 * max_cols.2;
        result += power;
    }
    dbg!(result);
}

