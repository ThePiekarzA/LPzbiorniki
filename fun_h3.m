function out = fun_h3(teta)

    %teta(1) = C3
    %teta(2) = D3
    %teta(3) = p3
    %teta(4) = H30 - initial H3 value
    
    global h3_
    global H3_estymowane
    
    t = h3_(:,1);
    H3 = h3_(:,2);
    
    a = 31;
    r = 39;
    w = 5;
    H3max = 35;
    C3 = teta(1);
    D3 = teta(2);
    p3 = teta(3);
    H30 = teta(4);
    
    h3_cols = size(h3_,2);
    h3_rows = size(h3_,1);
    
    ode_rhs = @(t,H3)(-C3*(H3+D3)^p3)/(w*sqrt(r.^2 - (r-H3).^2));
   
    [te, H3e] = ode45(ode_rhs, [0:0.01:h3_rows/100-0.01], H30);
    
    DH3 = H3e - H3;
    out = 1/2*dot(DH3, DH3);
    H3_estymowane = H3e;
    
end


