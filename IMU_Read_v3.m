function [t, acc, gyro, mag] = IMU_Read_v3
    s = serial('COM6');  %IMU is connected to com port 6
    fopen(s);  % open com6 for data read
    %fprintf(s, '*IDN?');


    idn = str2num(fgets(s));
    format long;
    
    t = idn(1);
    
    aX = idn(2);
    aY = idn(3);
    aZ = idn(4);
    
    gX = idn(5);
    gY = idn(6);
    gZ = idn(7);
    
    mX = idn(8);
    mY = idn(9);
    mZ = idn(10);
    
    acc(1, 1) = aX;
    acc(1, 2) = aY;
    acc(1, 3) = aZ;
    
    gyro(1, 1) = gX;
    gyro(1, 2) = gY;
    gyro(1, 3) = gZ;
    
    mag(1, 1) = mX;
    mag(1, 2) = mY;
    mag(1, 3) = mZ;
    
   % disp(size(acc));
   % disp(gyro);
   % disp(mag);
    

    
   % disp(idn);

    fclose(s);
    delete(s);
   % clear s;
    
end
