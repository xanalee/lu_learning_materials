#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""
@Time ：2024/3/4 01:35 
@Auth ：xana lee
@File ：dag.py
@IDE ：PyCharm
@Motto ：ABC(Always Be Coding)
"""

import dagviz
import networkx as nx

G = nx.DiGraph()
node_ls = ['BPMEDS', 'SEX', 'AGE', 'SYSBP', 'DIABP', 'CURSMOKE', 'EDUC', 'BMI', 'HEARTRTE', 'ANGINA', 'HOSPMI',
           'STROKE', 'CVD', 'HYPERTEN', 'DEATH']
for no in node_ls:
    G.add_node(no)

G.add_edge("BPMEDS", "SYSBP")
G.add_edge("BPMEDS", "DIABP")
G.add_edge("BPMEDS", "HEARTRTE")
G.add_edge("SEX", "SYSBP")
G.add_edge("SEX", "DIABP")
G.add_edge("SEX", "CURSMOKE")
G.add_edge("SEX", "BMI")
G.add_edge("SEX", "HEARTRTE")
G.add_edge("AGE", "SYSBP")
G.add_edge("AGE", "DIABP")
G.add_edge("AGE", "HEARTRTE")
G.add_edge("AGE", "BMI")
G.add_edge("AGE", "EDUC")
G.add_edge("AGE", "DEATH")
# G.add_edge("SYSBP", "HYPERTEN")
# G.add_edge("DIABP", "HYPERTEN")
G.add_edge("CURSMOKE", "DEATH")
G.add_edge("EDUC", "BPMEDS")
G.add_edge("EDUC", "DEATH")
G.add_edge("BMI", "SYSBP")
G.add_edge("BMI", "DIABP")
G.add_edge("BMI", "HEARTRTE")
G.add_edge("HEARTRTE", "ANGINA")
G.add_edge("HEARTRTE", "HOSPMI")
G.add_edge("HEARTRTE", "STROKE")
G.add_edge("HEARTRTE", "CVD")
# G.add_edge("HEARTRTE", "HYPERTEN")
G.add_edge("ANGINA", "CVD")
G.add_edge("HOSPMI", "CVD")
G.add_edge("HOSPMI", "DEATH")
G.add_edge("STROKE", "DEATH")
G.add_edge("CVD", "STROKE")
G.add_edge("CVD", "DEATH")
G.add_edge("HYPERTEN", "BPMEDS")
G.add_edge("HYPERTEN", "ANGINA")
G.add_edge("HYPERTEN", "HOSPMI")
G.add_edge("HYPERTEN", "STROKE")
G.add_edge("HYPERTEN", "CVD")
G.add_edge("HYPERTEN", "DEATH")
r = dagviz.render_svg(G)
print(1)
