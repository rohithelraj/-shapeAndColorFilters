cam=CentralCamera('default', 'pose',transl(0,1,2)*troty(pi/2)*trotz(-pi/2));
axis([-5 5 -5 5 -5 5 ]);
cam.plot_camera;
P = [4 0 0]';
plot_sphere(P, 0.2);
cam.project(P);
cam.plot(P);
help CentralCamera;