function out = fun_h2(teta)

    %teta(1) = C2
    %teta(2) = D2
    %teta(3) = p2
    %teta(4) = H20 - initial H1 value
    
    global h2_
    global H2_estymowane
    
    t = h2_(:,1);
    H2 = h2_(:,2);
    
    a = 31;
    b = 46.5;
    c = 10;
    w = 5;
    H2max = 35;
    C2 = teta(1);
    D2 = teta(2);
    p2 = teta(3);
    H20 = teta(4);
    
    h2_cols = size(h2_,2);
    h2_rows = size(h2_,1);
    
    ode_rhs = @(t,H2)(-C2*(H2+D2)^p2)/(c*w + (H2*b*w)/H2max );
   
    [te, H2e] = ode45(ode_rhs, [0:0.01:h2_rows/100-0.01], H20);
    
    DH2 = H2e - H2;
    out = 1/2*dot(DH2, DH2);
    H2_estymowane = H2e;
    
end


