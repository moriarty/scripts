#!/usr/bin/env python

#None of the following required topics are found. 
# (NAME, TYPE): [('/pointcloud', 'sensor_msgs/PointCloud'), ('/pointcloud2', 'sensor_msgs/PointCloud2'), ('/image', 'sensor_msgs/Image'), ('/camera_info', 'sensor_msgs/CameraInfo')]
import rospy
from sensor_msgs.msg import PointCloud
from sensor_msgs.msg import PointCloud2
from sensor_msgs.msg import Image
from sensor_msgs.msg import CameraInfo

def talker():
    pcpub = rospy.Publisher('pointcloud', PointCloud)
    pc2pub = rospy.Publisher('pointcloud2', PointCloud2)
    imgpub = rospy.Publisher('image', Image)
    cinfpub = rospy.Publisher('camera_info', CameraInfo)
    rospy.init_node('talker')
    while not rospy.is_shutdown():
        rospy.sleep(1.0)
        pass

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass


