
% This clears the port for reuse 
delete(instrfind({'Port'}, {'COM6'}));

% In this program we use the AHRS filter
% An attitude and heading reference system (AHRS) consist of a 9-axis system that uses an accelerometer, gyroscope, and magnetometer
% to compute orientation of the device. The ahrsfilter produces a smoothly changing estimate of orientation of the device,
% while correctly estimating the north direction. The ahrsfilter has the ability to remove gyroscope bias and can also detect
% and reject mild magnetic jamming.

% GyroscopeNoise and AccelerometerNoise is determined from datasheet.
GyroscopeNoiseMPU9250 = 3.0462e-06; % GyroscopeNoise (variance value) in units of rad/s
AccelerometerNoiseMPU9250 = 0.0061; % AccelerometerNoise(variance value)in units of m/s^2
viewer = HelperOrientationViewer('Title',{'AHRS Filter'});
FUSE = ahrsfilter('SampleRate',100, 'GyroscopeNoise',GyroscopeNoiseMPU9250,'AccelerometerNoise',AccelerometerNoiseMPU9250);
stopTimer = 100;

tic;
while(toc < stopTimer)
    %[accel,gyro,mag] = readSensorDataMPU9250(imu);
    [time,accel,gyro,mag] = IMU_Read_v3;
    rotators = FUSE(accel,gyro,mag);
    for j = numel(rotators)
        viewer(rotators(j));
    end
end
