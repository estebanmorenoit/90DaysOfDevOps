# #90DaysOfDevOps Challenge - Day 76 - Build a Grafana Dashboard

Welcome back to the #90DaysOfDevOps Challenge. On Day 76, we'll dive into the exciting world of Grafana dashboards. Grafana dashboards provide an intuitive and visual way to monitor your data, presenting it through various visualizations and panels. Let's learn how to build a Grafana dashboard step by step!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690221261261/e43c532e-1d87-4810-b540-ca51834727c9.png align="center")

## Grafana Dashboard

A Grafana dashboard offers a comprehensive view of your data, allowing you to track metrics and trends through different visualizations. Dashboards are made up of panels, each representing a specific aspect of the data story you want to convey. Each panel consists of a query, defining the data you wish to display, and a visualization, defining how the data is presented.

## Task: Build a Simple Grafana Dashboard

1. In the sidebar, hover your cursor over the Create (plus sign) icon and then click "New Dashboard".
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690221530933/ea82a351-a208-4f41-b583-16ce3e5dd044.jpeg align="center")
    
2. Click "Add visualization" and select Prometheus as your data source.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690221568929/f69f6be3-d169-4563-8be8-fe32adbf5ce2.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690221614871/3dab8852-a371-4f5c-adcc-1cd87172a54f.jpeg align="center")
    
3. In the Query editor below the graph, enter the below query and then press Shift + Enter:
    
    ```bash
    100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
    ```
    
    This query calculates the CPU usage percentage by subtracting the average idle CPU time `(node_cpu_seconds_total)` from 100.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690224189520/51037440-c2f7-4049-a452-0e4760f069b6.jpeg align="center")
    
4. In the Panel editor on the right, under Settings, change the panel title to “CPU Usage Percentage”.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690224246188/6ab262b4-b7cf-470d-8f82-6e25d9ea05d6.jpeg align="center")
    
5. Click "Apply" in the top-right corner to save the panel and go back to the dashboard view.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690224271731/63bff54c-d7cf-406b-ac34-fb8ac4c588c4.jpeg align="center")
    
6. Click the "Save dashboard" (disk) icon at the top of the dashboard to save your dashboard.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690224301148/0a5839c1-f522-484d-be96-d69126fbda37.jpeg align="center")
    
7. Enter a name in the Dashboard name field and then click Save.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690224343943/50c135c8-6262-4852-bc52-c44070079538.jpeg align="center")
    

Congratulations! You've successfully built a simple Grafana dashboard with the CPU usage percentage. Grafana's powerful visualization and customization options enable you to create informative and visually appealing dashboards for monitoring and analyzing your data.

Stay tuned for Day 77 of the #90daysofdevops challenge, where we'll explore Alerting and Grafana Cloud.