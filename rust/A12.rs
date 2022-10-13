use proconio::input;
// 人のを参考に rust してみた

fn check(k: usize, time: usize, printers: &Vec<usize>) -> bool{
    let mut papers = 0;
    for i in 0..printers.len(){
        papers += time / printers[i];
    }
    return papers < k
}

fn main() {

    input! { n: usize,
             k: usize,
             printers: [usize; n]
    };

    let mut tmin = 1;
    let mut tmax = 1000000000;

    while tmin < tmax {
        let tmid = (tmin + tmax) / 2;
        let f = check(k, tmid, &printers);

        if f {tmin = tmid + 1;}
        else {tmax = tmid;}
    }
    println!("{}", tmin);
}
