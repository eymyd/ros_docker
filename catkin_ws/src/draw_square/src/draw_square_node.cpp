 #include <ros/ros.h>
 #include <turtlesim/Pose.h>
 #include <geometry_msgs/Twist.h>
 #include <std_srvs/Empty.h>
 
 #define PI 3.141592
 
 void poseCallback(const turtlesim::PoseConstPtr& pose)
 {
	 ROS_INFO("SUB:x=%i y=%i",pose->x,pose->y);
 }
 
 
 int main(int argc, char** argv)
 {
   ros::init(argc, argv, "draw_square");
   ros::NodeHandle nh;
   ros::Subscriber pose_sub = nh.subscribe("turtle1/pose", 1, poseCallback);
   ros::Publisher twist_pub = nh.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 1);
   ros::ServiceClient reset = nh.serviceClient<std_srvs::Empty>("reset");
 
   std_srvs::Empty empty;
   reset.call(empty);

   ros::Rate loop_rate(10);

  while(ros::ok())
  {
	  ROS_INFO("STEP");
	  ros::spinOnce();
	  loop_rate.sleep();
  }
 }
