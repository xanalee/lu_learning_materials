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

G.add_edge("BPMEDS", "HYPERTEN")
G.add_edge("BPMEDS", "ANGINA")
G.add_edge("BPMEDS", "HOSPMI")
G.add_edge("BPMEDS", "STROKE")
G.add_edge("BPMEDS", "CVD")
G.add_edge("BPMEDS", "DEATH")

G.add_edge("SEX", "EDUC")
G.add_edge("SEX", "SYSBP")
G.add_edge("SEX", "DIABP")
G.add_edge("SEX", "CURSMOKE")
G.add_edge("SEX", "BMI")
G.add_edge("SEX", "HEARTRTE")
G.add_edge("SEX", "HYPERTEN")
G.add_edge("SEX", "ANGINA")
G.add_edge("SEX", "HOSPMI")
G.add_edge("SEX", "STROKE")
G.add_edge("SEX", "CVD")
G.add_edge("SEX", "DEATH")

G.add_edge("AGE", "EDUC")
G.add_edge("AGE", "SYSBP")
G.add_edge("AGE", "DIABP")
G.add_edge("AGE", "HYPERTEN")
G.add_edge("AGE", "ANGINA")
G.add_edge("AGE", "HOSPMI")
G.add_edge("AGE", "STROKE")
G.add_edge("AGE", "CVD")
G.add_edge("AGE", "DEATH")

G.add_edge("CURSMOKE", "SYSBP")
G.add_edge("CURSMOKE", "DIABP")
G.add_edge("CURSMOKE", "HYPERTEN")
G.add_edge("CURSMOKE", "ANGINA")
G.add_edge("CURSMOKE", "HOSPMI")
G.add_edge("CURSMOKE", "STROKE")
G.add_edge("CURSMOKE", "CVD")
G.add_edge("CURSMOKE", "DEATH")

G.add_edge("SYSBP", "BPMEDS")
G.add_edge("SYSBP", "HEARTRTE")

G.add_edge("DIABP", "BPMEDS")
G.add_edge("DIABP", "HEARTRTE")

G.add_edge("EDUC", "BPMEDS")
G.add_edge("EDUC", "CURSMOKE")
G.add_edge("EDUC", "BMI")
G.add_edge("EDUC", "DEATH")

G.add_edge("BMI", "SYSBP")
G.add_edge("BMI", "DIABP")
G.add_edge("BMI", "HEARTRTE")
G.add_edge("BMI", "HYPERTEN")
G.add_edge("BMI", "DEATH")

G.add_edge("HEARTRTE", "DEATH")

G.add_edge("HOSPMI", "ANGINA")
G.add_edge("HOSPMI", "DEATH")

G.add_edge("STROKE", "DEATH")

G.add_edge("CVD", "DEATH")

G.add_edge("HYPERTEN", "ANGINA")
G.add_edge("HYPERTEN", "HOSPMI")
G.add_edge("HYPERTEN", "STROKE")
G.add_edge("HYPERTEN", "CVD")
G.add_edge("HYPERTEN", "DEATH")
r = dagviz.render_svg(G)
print(1)
