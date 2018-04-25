function out = fun_h1(teta)

    %teta(1) = C1
    %teta(2) = D1
    %teta(3) = p1
    %teta(4) = H10 - initial H1 value
    
    global h1_
    global H1_estymowane
    
    t = h1_(:,1);
    H1 = h1_(:,2);
    
    a = 31;
    w = 5;
    C1 = teta(1);
    D1 = teta(2);
    p1 = teta(3);
    H10 = teta(4);
    H1_cols = size(h1_,2);
    H1_rows = size(h1_,1);
    
    ode_rhs = @(t,H1)(-C1*(H1+D1)^p1)/(a*w);
   
    [te, H1e] = ode45(ode_rhs, [0:0.01:H1_rows/100-0.01], H10);
%     size(te,1)
%     size(t,1)
%     t(:,1) -te
%     assert(all((t(:,1) - te) == 0))
    
    DH1 = H1e - H1;
    out = 1/2*dot(DH1, DH1);
    H1_estymowane = H1e;
%     function dx = ode_rhs_nested(t,x)
%         dx = -x
%     end
end


