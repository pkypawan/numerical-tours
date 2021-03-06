Jmax = log2(n) - 1;
Jmin = 1;
fW = copy(f);
clf;
for j = Jmax : - 1 : Jmin
    A = fW[1 : Int(2^(j + 1)), 1 : Int(2^(j + 1))];
    for d = 1 : 2
        Coarse = subsampling(cconvol(A, h, d), d);
        Detail = subsampling(cconvol(A, g, d), d);
        A = cat(d, Coarse, Detail );
    end
    fW[1 : Int(2^(j + 1)), 1 : Int(2^(j + 1))] = A;
    j1 = Jmax - j;
    if j1 < 4
        imageplot(A[1 : Int(2^j), Int(2^j + 1) : Int(2^(j+1))], "Horizontal, j=$j", [3, 4, j1 + 1]);
        imageplot(A[Int(2^j + 1) : Int(2^(j+1)), 1 : Int(2^j)], "Vertical, j=$j", [3, 4, j1 + 5]);
        imageplot(A[Int(2^j + 1) : Int(2^(j+1)), Int(2^j+1) : Int(2^(j + 1))], "Diagonal, j=$j", [3, 4, j1 + 9]);
    end
end
